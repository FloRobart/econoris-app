import 'dart:async';

import 'package:econoris_app/domain/models/operations/create/operation_create.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/domain/use_cases/operations/operation_usecase.dart';
import 'package:econoris_app/data/services/auth/auth_manager.dart';
import 'package:econoris_app/ui/core/ui/operations/view_models/financial_month_search_window.dart';
import 'package:econoris_app/ui/operations/view_models/loaded_operations.dart';
import 'package:econoris_app/ui/operations/view_models/month_change_card_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider d'etat asynchrone pour les operations de l'ecran d'accueil.
final operationViewModelProvider =
    AsyncNotifierProvider<OperationViewModel, LoadedOperations>(
      OperationViewModel.new,
    );

/// ViewModel pour l'ecran d'accueil.
///
/// The operations are loaded by pages (see [LoadedOperations]): the most recent ones at start,
/// the older ones when the user asks for them or goes back to an older month.
class OperationViewModel extends AsyncNotifier<LoadedOperations> {
  late final OperationUseCase _useCase;

  @override
  Future<LoadedOperations> build() async {
    _useCase = ref.read(operationUseCaseProvider);

    final authStatus = ref.watch(authNotifierProvider);
    if (authStatus != AuthStatus.authenticated) {
      return LoadedOperations.empty();
    }

    /* Going back to an older month loads the operations its statistics need */
    ref.listen(
      monthChangeCardViewModelProvider.select((state) => state.monthOffset),
      (_, monthOffset) => unawaited(_loadOperationsNeededByMonth(monthOffset)),
    );

    return _loadRecentOperations();
  }

  /// Loads the most recent operations again, as at start: the older pages loaded since are left out.
  Future<void> refresh() async {
    state = const AsyncLoading();
    final reloadedOperations = await AsyncValue.guard(_loadRecentOperations);
    if (!ref.mounted) return;

    state = reloadedOperations;

    /* The month shown may have changed during the loading, and need older operations */
    await _loadOperationsSince(_firstDayNeededByShownMonth());
  }

  /// Loads the page of operations just before the loaded ones.
  Future<void> loadOlderOperations() async {
    final loadedOperations = _loadedOperations;
    if (loadedOperations == null) return;

    await _loadOperationsSince(loadedOperations.previousPageEndDate);
  }

  /// Cree une operation cote serveur puis met a jour l'etat local.
  Future<void> addOperation(OperationCreate body) async {
    final createdOperation = await _useCase.addOperation(body);
    _updateLoadedOperations(
      (loadedOperations) =>
          loadedOperations.withOperationAdded(createdOperation),
    );
  }

  /// Met a jour une operation cote serveur puis met a jour l'etat local.
  Future<void> editOperation(Operation operation) async {
    final updatedOperation = await _useCase.updateOperation(
      operation.id,
      operation,
    );
    _updateLoadedOperations(
      (loadedOperations) =>
          loadedOperations.withOperationReplaced(updatedOperation),
    );
  }

  /// Supprime une operation cote serveur puis met a jour l'etat local.
  Future<void> deleteOperation(int id) async {
    await _useCase.deleteOperation(id);
    _updateLoadedOperations(
      (loadedOperations) => loadedOperations.withOperationRemoved(id),
    );
  }

  /*=========*/
  /* LOADING */
  /*=========*/
  /// Loads the first page of operations, the older ones that the month shown needs,
  /// and the levy day of the oldest operation.
  Future<LoadedOperations> _loadRecentOperations() async {
    /* The month shown may already be an older one, when the operations are loaded again */
    final loadedSince = LoadedOperations.pageStartDateHolding(
      _firstDayNeededByShownMonth(),
      latestPageStartDate: LoadedOperations.firstPageStartDate(DateTime.now()),
    );

    final (operations, oldestOperationDate) = await (
      _useCase.getOperations(startDate: loadedSince),
      _useCase.getOldestOperationDate(),
    ).wait;

    return LoadedOperations(
      operations: operations,
      loadedSince: loadedSince,
      oldestOperationDate: oldestOperationDate,
    );
  }

  /// Loads the operations that the statistics of the month [monthOffset] need, once the first ones are loaded.
  Future<void> _loadOperationsNeededByMonth(int monthOffset) async {
    try {
      await future;
    } catch (_) {
      /* The first operations could not be loaded: the screens show it, and a refresh loads them again */
      return;
    }

    await _loadOperationsSince(FinancialMonthSearchWindow(monthOffset).start);
  }

  /// Loads the operations older than the loaded ones, back to the page that holds [date].
  /// A failure is kept in the state, so that the screens show it and let the user try again.
  Future<void> _loadOperationsSince(DateTime date) async {
    final loadedOperations = _loadedOperations;
    if (loadedOperations == null || loadedOperations.isLoadedSince(date)) {
      return;
    }

    /* The loading in progress checks the needs of the month shown once it is over */
    final isAlreadyLoading =
        loadedOperations.olderOperationsLoading ==
        OlderOperationsLoading.inProgress;
    if (isAlreadyLoading) return;

    final pageStartDate = LoadedOperations.pageStartDateHolding(
      date,
      latestPageStartDate: loadedOperations.loadedSince,
    );
    state = AsyncData(
      loadedOperations.copyWith(
        olderOperationsLoading: OlderOperationsLoading.inProgress,
      ),
    );

    try {
      final olderOperations = await _useCase.getOperations(
        startDate: pageStartDate,
        endDate: loadedOperations.previousPageEndDate,
      );
      _updateOlderPages(
        loadedOperations.loadedSince,
        (currentOperations) => currentOperations.withOlderOperations(
          olderOperations,
          pageStartDate,
        ),
      );
    } catch (_) {
      _updateOlderPages(
        loadedOperations.loadedSince,
        (currentOperations) => currentOperations.copyWith(
          olderOperationsLoading: OlderOperationsLoading.failed,
        ),
      );
      return;
    }

    /* The month shown may have changed during the loading, and need even older operations */
    if (!ref.mounted) return;
    await _loadOperationsSince(_firstDayNeededByShownMonth());
  }

  /// First day whose operations the statistics of the month shown need.
  DateTime _firstDayNeededByShownMonth() {
    final monthOffset = ref.read(monthChangeCardViewModelProvider).monthOffset;
    return FinancialMonthSearchWindow(monthOffset).start;
  }

  /*=======*/
  /* STATE */
  /*=======*/
  /// The loaded operations, or null while they are loading or could not be loaded.
  LoadedOperations? get _loadedOperations {
    if (!ref.mounted) return null;

    return switch (state) {
      AsyncData(:final value) => value,
      _ => null,
    };
  }

  /// Replaces the loaded operations by the result of [update], if they are still loaded.
  void _updateLoadedOperations(
    LoadedOperations Function(LoadedOperations loadedOperations) update,
  ) {
    final loadedOperations = _loadedOperations;
    if (loadedOperations == null) return;

    state = AsyncData(update(loadedOperations));
  }

  /// Applies the result of the loading of older pages, started when the operations were loaded since [loadedSince].
  void _updateOlderPages(
    DateTime loadedSince,
    LoadedOperations Function(LoadedOperations currentOperations) update,
  ) {
    _updateLoadedOperations((currentOperations) {
      /* A refresh during the loading started again from the first page: these older pages would leave a gap */
      if (currentOperations.loadedSince != loadedSince) {
        return currentOperations;
      }

      return update(currentOperations);
    });
  }
}
