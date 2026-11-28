import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/categories/view_models/category_viewmodel.dart';
import 'package:econoris_app/ui/operations/view_models/month_change_card_viewmodel.dart';
import 'package:econoris_app/ui/operations/view_models/operation_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider derive unique qui calcule les statistiques de la home.
final operationStatsProvider = Provider<AsyncValue<OperationStatsViewModel>>((
  ref,
) {
  final asyncOperations = ref.watch(operationViewModelProvider);
  final monthOffset = ref.watch(
    monthChangeCardViewModelProvider.select((state) => state.monthOffset),
  );

  /* Without the categories, the statistics are still computed: they are refined once the categories are loaded */
  final categoryCatalog =
      ref.watch(categoryViewModelProvider).value ?? CategoryCatalog.empty();

  return asyncOperations.whenData(
    (operations) => OperationStatsViewModel.fromOperations(
      operations,
      monthOffset,
      categoryCatalog,
    ),
  );
});

/// Statistiques de synthese calculees en un seul parcours de la liste.
class OperationStatsViewModel {
  const OperationStatsViewModel({
    required this.startMonthDate,
    required this.endMonthDate,

    required this.monthlyOperationsCount,
    required this.monthlyOperationsAmount,

    required this.monthlyPositiveOperationsCount,
    required this.monthlyPositiveOperationsAmount,

    required this.monthlyNegativeOperationsCount,
    required this.monthlyNegativeOperationsAmount,

    required this.monthlyMoneyManagementIndex,
    required this.monthlyPossibleExpenses,

    required this.monthlyPossibleExpensesRatio,
  });

  final DateTime startMonthDate;
  final DateTime endMonthDate;

  final int monthlyOperationsCount;
  final double monthlyOperationsAmount;

  final int monthlyPositiveOperationsCount;
  final double monthlyPositiveOperationsAmount;

  final int monthlyNegativeOperationsCount;
  final double monthlyNegativeOperationsAmount;

  final double monthlyMoneyManagementIndex;
  final double monthlyPossibleExpenses;

  final double monthlyPossibleExpensesRatio;

  /// Calcule les statistiques à partir de la liste d'opérations en un seul parcours.
  factory OperationStatsViewModel.fromOperations(
    List<Operation> operations,
    int monthOffset,
    CategoryCatalog categoryCatalog,
  ) {
    FinancialDate financialDate = FinancialDate(
      operations,
      monthOffset,
      categoryCatalog,
    );

    final startMonthDate = financialDate.startDate;
    final endMonthDate = financialDate.endDate;
    final nextMonthStartDate = financialDate.nextStartDate;

    double operationsAmount = 0;
    int operationsCount = 0;

    int positiveOperationsCount = 0;
    double positiveOperationsAmount = 0;

    int negativeOperationsCount = 0;
    double negativeOperationsAmount = 0;

    double moneyManagementAvailableDepense = 0;
    double moneyManagementIndex = 0;

    for (final operation in operations) {
      if (operation.levyDate.isBefore(startMonthDate) ||
          !operation.levyDate.isBefore(nextMonthStartDate)) {
        continue;
      }

      operationsCount++;
      operationsAmount += operation.amount;

      if (operation.amount > 0) {
        positiveOperationsAmount += operation.amount;
        positiveOperationsCount++;
      } else {
        negativeOperationsAmount += operation.amount;
        negativeOperationsCount++;

        if (!categoryCatalog.belongsToAny(
          operation.categoryId,
          Constantes.unavailableMoneyManagementCategoryCodes,
        )) {
          moneyManagementAvailableDepense += operation.amount;
        }
      }
    }

    moneyManagementIndex =
        positiveOperationsAmount /
        (moneyManagementAvailableDepense.abs() != 0
            ? moneyManagementAvailableDepense.abs()
            : 1);

    double possibleExpenses =
        positiveOperationsAmount + negativeOperationsAmount;

    double possibleExpensesRatio = positiveOperationsAmount <= 0
        ? 0
        : possibleExpenses / positiveOperationsAmount;

    /// On retourne un objet de stats avec tous les calculs déjà faits pour éviter de les refaire dans le widget.
    return OperationStatsViewModel(
      startMonthDate: startMonthDate,
      endMonthDate: endMonthDate,
      monthlyOperationsCount: operationsCount,
      monthlyOperationsAmount: operationsAmount,
      monthlyPositiveOperationsCount: positiveOperationsCount,
      monthlyPositiveOperationsAmount: positiveOperationsAmount,
      monthlyNegativeOperationsCount: negativeOperationsCount,
      monthlyNegativeOperationsAmount: negativeOperationsAmount,
      monthlyMoneyManagementIndex: moneyManagementIndex,
      monthlyPossibleExpenses: possibleExpenses,
      monthlyPossibleExpensesRatio: possibleExpensesRatio,
    );
  }
}

/// Classe utilitaire pour calculer les dates de début et de fin du mois financier en se basant sur les opérations et le décalage de mois.
/// Le mois financier est défini comme la période entre deux opérations positives (salaires) successives. Si aucune opération positive n'est trouvée, on considère que le mois financier correspond au mois calendaire.
class FinancialDate {
  FinancialDate(
    List<Operation> operations,
    int monthOffset,
    this._categoryCatalog,
  ) {
    _startDate = _resolveFinancialMonthStartDate(operations, monthOffset);
    _nextStartDate = _resolveNextFinancialMonthStartDate(
      operations,
      monthOffset,
      _startDate!,
    );
  }

  /* Finds the salaries among the operations */
  final CategoryCatalog _categoryCatalog;

  DateTime? _startDate;
  DateTime? _nextStartDate;

  DateTime get startDate => _startDate ?? DateTime.now();

  /// The start of the next financial month: the operations of this month are before it.
  DateTime get nextStartDate => _nextStartDate ?? DateTime.now();

  /// The last day of the financial month, as displayed.
  DateTime get endDate => nextStartDate.subtract(const Duration(days: 1));

  DateTime _resolveFinancialMonthStartDate(
    List<Operation> operations,
    int monthOffset,
  ) {
    final now = DateTime.now();

    /// On définit une fenêtre de recherche autour de la date théorique du début du mois financier pour trouver la date réelle de début du mois financier.
    final windowStart = DateTime(
      now.year,
      now.month + monthOffset - 1,
      now.day,
    ).subtract(const Duration(days: Constantes.salaryWindowSafetyMarginDays));

    /// On définit la date de fin de la fenêtre de recherche. En réalité, on cherche la date de début du mois financier suivant à laquelle on soustrait un jour pour trouver la date de fin du mois financier actuel.
    final windowEnd = DateTime(
      now.year,
      now.month + monthOffset,
      now.day,
    ).add(const Duration(days: Constantes.salaryWindowSafetyMarginDays));

    /// On filtre les opérations pour ne garder que celles qui sont dans la fenêtre de recherche, qui sont positives et de catégorie "Salaire". Ensuite, on trie ces opérations par date pour trouver la plus récente.
    final positiveOperationsInWindow =
        operations
            .where(
              (operation) =>
                  operation.amount > 0 &&
                  operation.levyDate.isAfter(windowStart) &&
                  operation.levyDate.isBefore(windowEnd) &&
                  _categoryCatalog.hasCode(
                    operation.categoryId,
                    Constantes.salaryCategoryCode,
                  ),
            )
            .toList()
          ..sort((a, b) => a.levyDate.compareTo(b.levyDate));

    /// Si aucune opération positive n'est trouvée dans la fenêtre de recherche, on retourne la date théorique du début du mois financier, c'est à dire le premier de la date actuelle avec le décalage de mois appliqué.
    if (positiveOperationsInWindow.isEmpty) {
      return DateTime(now.year, now.month + monthOffset);
    }

    /* A salary much smaller than the others (a regularization, an advance) does not start a financial month.
       No comparison with the average: around payday the window holds two monthly salaries, and the smaller one would be left out */
    final minimumSalaryCandidateAmount =
        positiveOperationsInWindow
            .map((operation) => operation.amount)
            .reduce((a, b) => a > b ? a : b) /
        3;

    final salaryCandidates = positiveOperationsInWindow
        .where((operation) => operation.amount >= minimumSalaryCandidateAmount)
        .toList();

    /* The window goes a few days past its reference day, which is today for the current month:
       the salaries after that day are still to come */
    final firstSalaryOfLastPay = _findFirstSalaryOfLastPay(
      salaryCandidates,
      receivedBefore: DateTime(now.year, now.month + monthOffset, now.day + 1),
    );

    /* No salary received yet: a financial month does not start on a salary still to come */
    if (firstSalaryOfLastPay == null) {
      return DateTime(now.year, now.month + monthOffset);
    }

    return firstSalaryOfLastPay.levyDate;
  }

  /// Finds the salary that starts the financial month: the first salary of the last pay received before [receivedBefore].
  /// A pay can come in several salaries a few days apart: the salaries received less than the shortest financial month
  /// before the last one belong to its pay. [salaryCandidatesByDate] go from the least recent to the most recent.
  Operation? _findFirstSalaryOfLastPay(
    List<Operation> salaryCandidatesByDate, {
    required DateTime receivedBefore,
  }) {
    final receivedSalaries = salaryCandidatesByDate
        .where((salary) => salary.levyDate.isBefore(receivedBefore))
        .toList();
    if (receivedSalaries.isEmpty) {
      return null;
    }

    final lastReceivedSalaryDate = receivedSalaries.last.levyDate;

    return receivedSalaries.firstWhere(
      (salary) =>
          lastReceivedSalaryDate.difference(salary.levyDate).inDays <
          Constantes.minimumFinancialMonthDays,
    );
  }

  /// Finds the start of the next financial month: the next salary, or one month after the start of this financial month
  /// when the next salary is too close to it or too far from it.
  DateTime _resolveNextFinancialMonthStartDate(
    List<Operation> operations,
    int monthOffset,
    DateTime financialMonthStartDate,
  ) {
    DateTime startNextFinancialDate = _resolveFinancialMonthStartDate(
      operations,
      monthOffset + 1,
    );

    /// Si l'écart entre la date de début du mois financier suivant et la date de début du mois financier actuel est inférieur à 1 mois - 4 jours ou supérieur à 1 mois + 4 jours, on considère que la date de fin du mois financier actuel est la date de début du mois financier actuel plus 1 mois.
    if (startNextFinancialDate.difference(financialMonthStartDate).inDays <
            Constantes.minimumFinancialMonthDays ||
        startNextFinancialDate.difference(financialMonthStartDate).inDays >
            Constantes.maximumFinancialMonthDays) {
      return DateTime(
        financialMonthStartDate.year,
        financialMonthStartDate.month + 1,
        financialMonthStartDate.day,
      );
    }

    return startNextFinancialDate;
  }
}
