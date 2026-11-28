import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/operations/view_models/operation_stats_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../category_test_catalog.dart';

void main() {
  final DateTime now = DateTime.now();

  Operation buildOperation({
    required double amount,
    required int categoryId,
    DateTime? levyDate,
  }) {
    return Operation(
      id: categoryId,
      levyDate: levyDate ?? now,
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

  group('OperationStatsViewModel start of the current financial month', () {
    /* FinancialDate reads the current date: the salaries are placed around today and around the same day last month */
    DateTime daysFromToday(int days) {
      return DateTime(now.year, now.month, now.day + days);
    }

    DateTime daysFromSameDayLastMonth(int days) {
      return DateTime(now.year, now.month - 1, now.day + days);
    }

    Operation buildSalary({
      required double amount,
      required DateTime levyDate,
    }) {
      return buildOperation(
        amount: amount,
        categoryId: salary.id,
        levyDate: levyDate,
      );
    }

    DateTime startOfCurrentFinancialMonth(List<Operation> operations) {
      return OperationStatsViewModel.fromOperations(
        operations,
        0,
        buildTestCategoryCatalog(),
      ).startMonthDate;
    }

    test('starts on the salary received a few days ago, not on the one of last month', () {
      final salaryOfThisMonth = buildSalary(
        amount: 2000,
        levyDate: daysFromToday(-2),
      );
      final operations = [
        buildSalary(amount: 2000, levyDate: daysFromSameDayLastMonth(-2)),
        salaryOfThisMonth,
      ];

      expect(
        startOfCurrentFinancialMonth(operations),
        salaryOfThisMonth.levyDate,
      );
    });

    test('starts on the salary received a few days ago, even when the one of last month was higher', () {
      final salaryOfThisMonth = buildSalary(
        amount: 2000,
        levyDate: daysFromToday(-2),
      );
      final operations = [
        buildSalary(amount: 2100, levyDate: daysFromSameDayLastMonth(-2)),
        salaryOfThisMonth,
      ];

      expect(
        startOfCurrentFinancialMonth(operations),
        salaryOfThisMonth.levyDate,
      );
    });

    test('stays on the salary of last month while the next one is to come', () {
      final salaryOfLastMonth = buildSalary(
        amount: 2000,
        levyDate: daysFromSameDayLastMonth(2),
      );
      final operations = [
        salaryOfLastMonth,
        buildSalary(amount: 2000, levyDate: daysFromToday(2)),
      ];

      expect(
        startOfCurrentFinancialMonth(operations),
        salaryOfLastMonth.levyDate,
      );
    });

    test(
      'stays on the salary of last month while a higher next one is to come',
      () {
        final salaryOfLastMonth = buildSalary(
          amount: 2000,
          levyDate: daysFromSameDayLastMonth(2),
        );
        final operations = [
          salaryOfLastMonth,
          buildSalary(amount: 2100, levyDate: daysFromToday(2)),
        ];

        expect(
          startOfCurrentFinancialMonth(operations),
          salaryOfLastMonth.levyDate,
        );
      },
    );

    test('starts on the first day of the month while the only salary is still to come', () {
      final operations = [
        buildSalary(amount: 2000, levyDate: daysFromToday(2)),
      ];

      expect(
        startOfCurrentFinancialMonth(operations),
        DateTime(now.year, now.month),
      );
    });

    test('starts on the first salary of a pay received in two parts', () {
      final firstPartOfThePay = buildSalary(
        amount: 2000,
        levyDate: daysFromToday(-3),
      );
      final operations = [
        firstPartOfThePay,
        buildSalary(amount: 2000, levyDate: daysFromToday(-1)),
      ];

      expect(
        startOfCurrentFinancialMonth(operations),
        firstPartOfThePay.levyDate,
      );
    });
  });

  group('OperationStatsViewModel end of the current financial month', () {
    test('ends the day before the next salary, and counts that last day', () {
      final lastDayOfTheMonth = DateTime(now.year, now.month + 1, now.day - 11);
      final operations = [
        buildOperation(
          amount: 2000,
          categoryId: salary.id,
          levyDate: DateTime(now.year, now.month, now.day - 10),
        ),
        buildOperation(
          amount: 2000,
          categoryId: salary.id,
          levyDate: DateTime(now.year, now.month + 1, now.day - 10),
        ),
        buildOperation(
          amount: -50,
          categoryId: rent.id,
          levyDate: lastDayOfTheMonth,
        ),
      ];

      final stats = OperationStatsViewModel.fromOperations(
        operations,
        0,
        buildTestCategoryCatalog(),
      );

      expect(stats.endMonthDate, lastDayOfTheMonth);
      expect(stats.monthlyNegativeOperationsAmount, -50);
    });
  });
}
