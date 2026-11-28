import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/operations/view_models/loaded_operations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Operation buildOperation({required int id, required DateTime levyDate}) {
    return Operation(
      id: id,
      levyDate: levyDate,
      label: 'Opération',
      amount: -10,
      categoryId: 49,
      source: null,
      destination: null,
      costs: 0,
      isValidate: true,
      userId: 42,
      subscriptionId: null,
      createdAt: levyDate,
      updatedAt: levyDate,
      isSelected: true,
    );
  }

  /// Operations loaded since September 1st 2026.
  LoadedOperations buildLoadedOperations({
    List<Operation> operations = const [],
    DateTime? oldestOperationDate,
  }) {
    return LoadedOperations(
      operations: operations,
      loadedSince: DateTime(2026, 9),
      oldestOperationDate: oldestOperationDate,
    );
  }

  group('LoadedOperations pages', () {
    test('starts with the current month and the two months before it', () {
      expect(
        LoadedOperations.firstPageStartDate(DateTime(2026, 11, 28)),
        DateTime(2026, 9),
      );
      expect(
        LoadedOperations.firstPageStartDate(DateTime(2026, 1, 15)),
        DateTime(2025, 11),
      );
    });

    test('goes back by whole pages to the page that holds a date', () {
      final latestPageStartDate = DateTime(2026, 9);

      expect(
        LoadedOperations.pageStartDateHolding(
          DateTime(2026, 10, 5),
          latestPageStartDate: latestPageStartDate,
        ),
        DateTime(2026, 9),
      );
      expect(
        LoadedOperations.pageStartDateHolding(
          DateTime(2026, 8, 24),
          latestPageStartDate: latestPageStartDate,
        ),
        DateTime(2026, 6),
      );
      expect(
        LoadedOperations.pageStartDateHolding(
          DateTime(2026, 2, 10),
          latestPageStartDate: latestPageStartDate,
        ),
        DateTime(2025, 12),
      );
    });

    test('loads next the page just before the loaded operations', () {
      final loadedOperations = buildLoadedOperations();

      expect(loadedOperations.previousPageStartDate, DateTime(2026, 6));
      expect(loadedOperations.previousPageEndDate, DateTime(2026, 8, 31));
    });
  });

  group('LoadedOperations older operations', () {
    test('has older operations while the oldest one is not loaded', () {
      expect(
        buildLoadedOperations(oldestOperationDate: DateTime(2024, 3, 12))
            .hasOlderOperations,
        isTrue,
      );
      expect(
        buildLoadedOperations(oldestOperationDate: DateTime(2026, 9))
            .hasOlderOperations,
        isFalse,
      );
      expect(buildLoadedOperations().hasOlderOperations, isFalse);
    });

    test('is loaded before its pages only when nothing older exists', () {
      final withOlderOperations = buildLoadedOperations(
        oldestOperationDate: DateTime(2024, 3, 12),
      );
      final withoutOlderOperations = buildLoadedOperations(
        oldestOperationDate: DateTime(2026, 10, 2),
      );

      expect(withOlderOperations.isLoadedSince(DateTime(2026, 9)), isTrue);
      expect(withOlderOperations.isLoadedSince(DateTime(2026, 8, 24)), isFalse);
      expect(withoutOlderOperations.isLoadedSince(DateTime(2020)), isTrue);
    });

    test('adds an older page, and keeps an operation loaded twice once', () {
      final movedOperation = buildOperation(
        id: 7,
        levyDate: DateTime(2026, 7, 14),
      );
      final loadedOperations = buildLoadedOperations(
        operations: [
          buildOperation(id: 1, levyDate: DateTime(2026, 10, 2)),
          movedOperation,
        ],
        oldestOperationDate: DateTime(2024, 3, 12),
      ).copyWith(olderOperationsLoading: OlderOperationsLoading.inProgress);

      final withOlderPage = loadedOperations.withOlderOperations([
        buildOperation(id: 3, levyDate: DateTime(2026, 6, 3)),
        movedOperation,
      ], DateTime(2026, 6));

      expect(withOlderPage.operations.map((operation) => operation.id), [
        1,
        7,
        3,
      ]);
      expect(withOlderPage.loadedSince, DateTime(2026, 6));
      expect(withOlderPage.olderOperationsLoading, OlderOperationsLoading.idle);
    });
  });
}
