import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/utils/operation_sort.dart';

/// Progress of the loading of the operations older than the loaded ones.
enum OlderOperationsLoading { idle, inProgress, failed }

/// Operations loaded by the application: every operation of the user from [loadedSince], upcoming ones included.
///
/// The operations are loaded by pages of [Constantes.operationsPageMonthsCount] calendar months,
/// from the most recent to the oldest, so that the application never waits for the whole history.
class LoadedOperations {
  const LoadedOperations({
    required this.operations,
    required this.loadedSince,
    required this.oldestOperationDate,
    this.olderOperationsLoading = OlderOperationsLoading.idle,
  });

  /// No operation, for a user who is not logged in.
  LoadedOperations.empty()
    : operations = const [],
      loadedSince = firstPageStartDate(DateTime.now()),
      oldestOperationDate = null,
      olderOperationsLoading = OlderOperationsLoading.idle;

  final List<Operation> operations;

  /// First day of the oldest loaded page.
  final DateTime loadedSince;

  /// Levy day of the oldest operation of the user, null if the user has no operation.
  final DateTime? oldestOperationDate;

  final OlderOperationsLoading olderOperationsLoading;

  /*=======*/
  /* PAGES */
  /*=======*/
  /// First day of the most recent page: it holds the current month and the months just before it.
  static DateTime firstPageStartDate(DateTime today) {
    return DateTime(
      today.year,
      today.month - Constantes.operationsPageMonthsCount + 1,
    );
  }

  /// First day of the page that holds [date], the pages being counted back from the one
  /// that starts on [latestPageStartDate].
  static DateTime pageStartDateHolding(
    DateTime date, {
    required DateTime latestPageStartDate,
  }) {
    DateTime pageStartDate = latestPageStartDate;
    while (pageStartDate.isAfter(date)) {
      pageStartDate = DateTime(
        pageStartDate.year,
        pageStartDate.month - Constantes.operationsPageMonthsCount,
      );
    }

    return pageStartDate;
  }

  /// First day of the page just before the loaded operations.
  DateTime get previousPageStartDate => pageStartDateHolding(
    previousPageEndDate,
    latestPageStartDate: loadedSince,
  );

  /// Last day of the page just before the loaded operations.
  DateTime get previousPageEndDate =>
      DateTime(loadedSince.year, loadedSince.month, loadedSince.day - 1);

  /*========*/
  /* STATUS */
  /*========*/
  /// Whether the user has operations older than the loaded ones.
  bool get hasOlderOperations =>
      oldestOperationDate?.isBefore(loadedSince) ?? false;

  /// Whether every operation of the user from [date] is loaded.
  bool isLoadedSince(DateTime date) {
    return !hasOlderOperations || !date.isBefore(loadedSince);
  }

  /*=========*/
  /* UPDATES */
  /*=========*/
  /// Adds the operations of the older pages, which start on [pageStartDate].
  /// An operation already loaded, because it was created or moved there since, is kept once only.
  LoadedOperations withOlderOperations(
    List<Operation> olderOperations,
    DateTime pageStartDate,
  ) {
    final olderOperationIds = olderOperations
        .map((operation) => operation.id)
        .toSet();
    final mergedOperations = [
      ...operations.where(
        (operation) => !olderOperationIds.contains(operation.id),
      ),
      ...olderOperations,
    ]..sort(operationSort);

    return LoadedOperations(
      operations: mergedOperations,
      loadedSince: pageStartDate,
      oldestOperationDate: oldestOperationDate,
    );
  }

  /// Adds an operation created by the user.
  LoadedOperations withOperationAdded(Operation createdOperation) {
    return copyWith(operations: [...operations, createdOperation]);
  }

  /// Replaces an operation by its updated version.
  LoadedOperations withOperationReplaced(Operation updatedOperation) {
    return copyWith(
      operations: operations
          .map(
            (operation) => operation.id == updatedOperation.id
                ? updatedOperation
                : operation,
          )
          .toList(),
    );
  }

  /// Removes a deleted operation.
  LoadedOperations withOperationRemoved(int deletedOperationId) {
    return copyWith(
      operations: operations
          .where((operation) => operation.id != deletedOperationId)
          .toList(),
    );
  }

  /// Copy whose pages stay the same.
  LoadedOperations copyWith({
    List<Operation>? operations,
    OlderOperationsLoading? olderOperationsLoading,
  }) {
    return LoadedOperations(
      operations: operations ?? this.operations,
      loadedSince: loadedSince,
      oldestOperationDate: oldestOperationDate,
      olderOperationsLoading:
          olderOperationsLoading ?? this.olderOperationsLoading,
    );
  }
}
