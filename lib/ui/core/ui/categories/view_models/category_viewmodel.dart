import 'package:econoris_app/data/services/auth/auth_manager.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/domain/models/operations/operation.dart';
import 'package:econoris_app/domain/use_cases/categories/category_usecase.dart';
import 'package:econoris_app/ui/operations/view_models/operation_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Number of categories suggested at the top of the category picker.
const int _suggestedCategoriesCount = 6;

/// Provides every category, loaded once for the session.
final categoryViewModelProvider =
    AsyncNotifierProvider<CategoryViewModel, CategoryCatalog>(
      CategoryViewModel.new,
    );

/// ViewModel of the categories, shared by every screen.
class CategoryViewModel extends AsyncNotifier<CategoryCatalog> {
  @override
  Future<CategoryCatalog> build() async {
    final authStatus = ref.watch(authNotifierProvider);
    if (authStatus != AuthStatus.authenticated) {
      return CategoryCatalog.empty();
    }

    return ref.read(categoryUseCaseProvider).getCategoryCatalog();
  }

  /// Loads the categories again, for instance after a network failure.
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(categoryUseCaseProvider).getCategoryCatalog(),
    );
  }
}

/// The ids of the categories the user chooses the most, for expenses (true) or for incomes (false).
/// They are suggested first in the category picker, the most used first.
final suggestedCategoryIdsProvider = Provider.family<List<int>, bool>((
  ref,
  isExpense,
) {
  final operations =
      ref.watch(operationViewModelProvider).value ?? const <Operation>[];

  final usageCountByCategoryId = <int, int>{};
  for (final operation in operations) {
    final isOperationExpense = operation.amount <= 0;
    if (isOperationExpense != isExpense) {
      continue;
    }

    usageCountByCategoryId.update(
      operation.categoryId,
      (usageCount) => usageCount + 1,
      ifAbsent: () => 1,
    );
  }

  final mostUsedCategoryIds = usageCountByCategoryId.keys.toList()
    ..sort(
      (firstCategoryId, secondCategoryId) => usageCountByCategoryId[secondCategoryId]!
          .compareTo(usageCountByCategoryId[firstCategoryId]!),
    );

  return mostUsedCategoryIds.take(_suggestedCategoriesCount).toList();
});
