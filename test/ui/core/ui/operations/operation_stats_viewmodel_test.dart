import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/operations/view_models/operation_stats_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../category_test_catalog.dart';

void main() {
  final DateTime now = DateTime.now();

  Operation buildOperation({required double amount, required int categoryId}) {
    return Operation(
      id: categoryId,
      levyDate: now,
      label: 'Opération',
      amount: amount,
      categoryId: categoryId,
      source: null,
      destination: null,
      costs: 0,
      isValidate: true,
      userId: 42,
      subscriptionId: null,
      createdAt: now,
      updatedAt: now,
      isSelected: true,
    );
  }

  group('OperationStatsViewModel money management index', () {
    final operations = [
      buildOperation(amount: 1000, categoryId: salary.id),
      buildOperation(amount: -100, categoryId: rent.id),
      buildOperation(amount: -500, categoryId: savingsAccounts.id),
    ];

    test('leaves out the money put aside, sub-categories included', () {
      final stats = OperationStatsViewModel.fromOperations(
        operations,
        0,
        buildTestCategoryCatalog(),
      );

      expect(stats.monthlyNegativeOperationsAmount, -600);
      expect(stats.monthlyMoneyManagementIndex, 10);
    });

    test('counts every expense while the categories are not loaded', () {
      final stats = OperationStatsViewModel.fromOperations(
        operations,
        0,
        CategoryCatalog.empty(),
      );

      expect(stats.monthlyMoneyManagementIndex, 1000 / 600);
    });
  });
}
