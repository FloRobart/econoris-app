import 'dart:async';

import 'package:econoris_app/data/repositories/operations/operation_repository.dart';
import 'package:econoris_app/data/services/auth/auth_manager.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/create/operation_create.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/categories/view_models/category_viewmodel.dart';
import 'package:econoris_app/ui/core/ui/operations/view_models/financial_month_search_window.dart';
import 'package:econoris_app/ui/core/ui/operations/view_models/operation_stats_viewmodel.dart';
import 'package:econoris_app/ui/operations/view_models/loaded_operations.dart';
import 'package:econoris_app/ui/operations/view_models/month_change_card_viewmodel.dart';
import 'package:econoris_app/ui/operations/view_models/operation_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// A period of levy days asked to the API.
typedef _RequestedPeriod = ({DateTime? startDate, DateTime? endDate});

/// Gives no operation without calling the API, and keeps every period asked.
class _FakeOperationRepository implements OperationRepository {
  _FakeOperationRepository({required this.oldestOperationDate});

  final DateTime? oldestOperationDate;
  final List<_RequestedPeriod> requestedPeriods = [];

  /// Fails the loading of the older pages.
  bool failsToLoadOlderPages = false;

  /// Keeps the older pages loading until it is completed.
  Completer<List<Operation>>? pendingOlderPages;

  @override
  Future<List<Operation>> getOperations({
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    requestedPeriods.add((startDate: startDate, endDate: endDate));

    /* Only the older pages have an end: the first page holds every upcoming operation */
    final isOlderPage = endDate != null;
    if (isOlderPage && failsToLoadOlderPages) throw Exception('No network');
    if (isOlderPage && pendingOlderPages != null) {
      return pendingOlderPages!.future;
    }

    return [];
  }

  @override
  Future<DateTime?> getOldestOperationDate() async => oldestOperationDate;

  @override
  Future<Operation> addOperation(OperationCreate body) =>
      throw UnimplementedError();

  @override
  Future<Operation> updateOperation(int id, Operation body) =>
      throw UnimplementedError();

  @override
  Future<Operation> deleteOperation(int id) => throw UnimplementedError();
}

/// A user already logged in, without reading the stored token.
class _LoggedInAuthManager extends AuthManager {
  @override
  AuthStatus build() => AuthStatus.authenticated;
}

/// No category, without calling the API.
class _TestCategoryViewModel extends CategoryViewModel {
  @override
  Future<CategoryCatalog> build() async => CategoryCatalog.empty();
}

void main() {
  /// Starts the view model with the operations of [repository], watched like by the screens.
  ProviderContainer startViewModel(_FakeOperationRepository repository) {
    final container = ProviderContainer.test(
      overrides: [
        authNotifierProvider.overrideWith(_LoggedInAuthManager.new),
        categoryViewModelProvider.overrideWith(_TestCategoryViewModel.new),
        operationRepositoryProvider.overrideWithValue(repository),
      ],
    );
    container.listen(operationViewModelProvider, (_, _) {});

    return container;
  }

  /// Lets the loadings started when the month changes finish.
  Future<void> waitForTheLoadings() {
    return Future<void>.delayed(const Duration(milliseconds: 10));
  }

  /// Goes back [monthsCount] months on the month change card.
  void goBackMonths(ProviderContainer container, int monthsCount) {
    final monthChangeCard = container.read(
      monthChangeCardViewModelProvider.notifier,
    );
    for (var month = 0; month < monthsCount; month++) {
      monthChangeCard.previousMonth();
    }
  }

  test(
    'loads the most recent months and every upcoming operation at start',
    () async {
      final repository = _FakeOperationRepository(
        oldestOperationDate: DateTime(2024, 3, 12),
      );
      final container = startViewModel(repository);

      final loadedOperations = await container.read(
        operationViewModelProvider.future,
      );

      final firstPageStartDate = LoadedOperations.firstPageStartDate(
        DateTime.now(),
      );
      expect(repository.requestedPeriods, [
        (startDate: firstPageStartDate, endDate: null),
      ]);
      expect(loadedOperations.loadedSince, firstPageStartDate);
      expect(loadedOperations.hasOlderOperations, isTrue);
    },
  );

  test('loads the page before the loaded operations on demand', () async {
    final repository = _FakeOperationRepository(
      oldestOperationDate: DateTime(2024, 3, 12),
    );
    final container = startViewModel(repository);
    final firstOperations = await container.read(
      operationViewModelProvider.future,
    );

    await container
        .read(operationViewModelProvider.notifier)
        .loadOlderOperations();

    expect(repository.requestedPeriods.last, (
      startDate: firstOperations.previousPageStartDate,
      endDate: firstOperations.previousPageEndDate,
    ));
    expect(
      container.read(operationViewModelProvider).value!.loadedSince,
      firstOperations.previousPageStartDate,
    );
  });

  test('asks for nothing older than the oldest operation', () async {
    final repository = _FakeOperationRepository(
      oldestOperationDate: DateTime.now(),
    );
    final container = startViewModel(repository);
    await container.read(operationViewModelProvider.future);

    await container
        .read(operationViewModelProvider.notifier)
        .loadOlderOperations();
    goBackMonths(container, 6);
    await waitForTheLoadings();

    expect(repository.requestedPeriods, hasLength(1));
  });

  test('loads, without gap, the operations of an older month the user goes back to', () async {
    final repository = _FakeOperationRepository(
      oldestOperationDate: DateTime(2024, 3, 12),
    );
    final container = startViewModel(repository);
    await container.read(operationViewModelProvider.future);

    goBackMonths(container, 5);
    await waitForTheLoadings();

    final loadedOperations = container.read(operationViewModelProvider).value!;
    expect(
      loadedOperations.isLoadedSince(FinancialMonthSearchWindow(-5).start),
      isTrue,
    );

    /* Each older page ends the day before the page loaded just before it */
    final requestedPeriods = repository.requestedPeriods;
    for (var index = 1; index < requestedPeriods.length; index++) {
      final newerPageStartDate = requestedPeriods[index - 1].startDate!;
      expect(
        requestedPeriods[index].endDate,
        DateTime(
          newerPageStartDate.year,
          newerPageStartDate.month,
          newerPageStartDate.day - 1,
        ),
      );
    }
  });

  test(
    'shows the statistics of an older month once its operations are loaded',
    () async {
      final repository = _FakeOperationRepository(
        oldestOperationDate: DateTime(2024, 3, 12),
      );
      final container = startViewModel(repository);
      await container.read(operationViewModelProvider.future);
      repository.pendingOlderPages = Completer<List<Operation>>();

      goBackMonths(container, 3);
      await waitForTheLoadings();
      expect(container.read(operationStatsProvider).isLoading, isTrue);

      repository.pendingOlderPages!.complete([]);
      await waitForTheLoadings();
      expect(container.read(operationStatsProvider).hasValue, isTrue);
    },
  );

  test(
    'keeps the loaded operations and tells the failure of an older page',
    () async {
      final repository = _FakeOperationRepository(
        oldestOperationDate: DateTime(2024, 3, 12),
      );
      final container = startViewModel(repository);
      final firstOperations = await container.read(
        operationViewModelProvider.future,
      );
      repository.failsToLoadOlderPages = true;

      await container
          .read(operationViewModelProvider.notifier)
          .loadOlderOperations();

      final loadedOperations = container
          .read(operationViewModelProvider)
          .value!;
      expect(
        loadedOperations.olderOperationsLoading,
        OlderOperationsLoading.failed,
      );
      expect(loadedOperations.loadedSince, firstOperations.loadedSince);
    },
  );
}
