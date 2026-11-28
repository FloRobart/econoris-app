import 'package:econoris_app/config/constantes.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/ui/core/ui/categories/view_models/category_viewmodel.dart';
import 'package:econoris_app/ui/core/ui/operations/view_models/financial_month_search_window.dart';
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

  /* The statistics of a month whose older operations are still loading would be wrong */
  final isShownMonthLoaded =
      asyncOperations.value?.isLoadedSince(
        FinancialMonthSearchWindow(monthOffset).start,
      ) ??
      true;
  if (!isShownMonthLoaded) {
    return const AsyncLoading();
  }

  return asyncOperations.whenData(
    (loadedOperations) => OperationStatsViewModel.fromOperations(
      loadedOperations.operations,
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
          !operation.levyDate.isBefore(endMonthDate)) {
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
    _endDate = _resolveFinancialMonthEndDate(
      operations,
      monthOffset,
      _startDate!,
    );
  }

  /* Finds the salaries among the operations */
  final CategoryCatalog _categoryCatalog;

  DateTime? _startDate;
  DateTime? _endDate;

  DateTime get startDate => _startDate ?? DateTime.now();
  DateTime get endDate => _endDate ?? DateTime.now();

  DateTime _resolveFinancialMonthStartDate(
    List<Operation> operations,
    int monthOffset,
  ) {
    final now = DateTime.now();

    /// On définit une fenêtre de recherche autour de la date théorique du début du mois financier pour trouver la date réelle de début du mois financier.
    final searchWindow = FinancialMonthSearchWindow(monthOffset);

    /// On filtre les opérations pour ne garder que celles qui sont dans la fenêtre de recherche, qui sont positives et de catégorie "Salaire". Ensuite, on trie ces opérations par date pour trouver la plus récente.
    final positiveOperationsInWindow =
        operations
            .where(
              (operation) =>
                  operation.amount > 0 &&
                  operation.levyDate.isAfter(searchWindow.start) &&
                  operation.levyDate.isBefore(searchWindow.end) &&
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

    /// On calcule le montant moyen des opérations positives dans la fenêtre de recherche pour filtrer les opérations candidates au salaire.
    /// En effet, on considère que le salaire est une opération positive qui a un montant supérieur ou égal au montant moyen des opérations positives dans la fenêtre de recherche.
    final averageSalaryAmount =
        positiveOperationsInWindow
            .map((operation) => operation.amount)
            .reduce((a, b) => a + b) /
        positiveOperationsInWindow.length;

    /// On filtre les opérations pour ne garder que celles qui ont un montant supérieur ou égal au montant moyen des opérations positives dans la fenêtre de recherche.
    final minAmountForSalaryCandidate =
        positiveOperationsInWindow
            .map((operation) => operation.amount)
            .reduce((a, b) => a > b ? a : b) /
        3;

    final salaryCandidates = positiveOperationsInWindow
        .where(
          (operation) =>
              operation.amount >= minAmountForSalaryCandidate &&
              operation.amount >= averageSalaryAmount,
        )
        .toList();

    /// Si aucune opération ne correspond au critère de montant, on retourne la date théorique du début du mois financier.
    if (salaryCandidates.isEmpty) {
      return DateTime(now.year, now.month + monthOffset);
    }

    /// On considère que la date de début du mois financier est la date de l'opération candidate au salaire la moins récente.
    final operationWithMaxAmount = salaryCandidates.reduce(
      (a, b) => a.levyDate.isBefore(b.levyDate) ? a : b,
    );

    return operationWithMaxAmount.levyDate;
  }

  /// Détermine la date de fin du mois financier en se basant sur la date de début du mois financier et en cherchant la date de début du mois financier suivant. Si la date de début du mois financier suivant est trop proche ou trop éloignée de la date de début du mois financier actuel, on considère que la date de fin du mois financier actuel est la date de début du mois financier actuel plus 1 mois.
  DateTime _resolveFinancialMonthEndDate(
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
            22 ||
        startNextFinancialDate.difference(financialMonthStartDate).inDays >
            38) {
      return DateTime(
        financialMonthStartDate.year,
        financialMonthStartDate.month + 1,
        financialMonthStartDate.day,
      );
    }

    return startNextFinancialDate.subtract(const Duration(days: 1));
  }
}
