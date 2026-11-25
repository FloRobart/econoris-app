import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/ui/core/ui/categories/category_display.dart';
import 'package:econoris_app/ui/core/ui/categories/view_models/category_viewmodel.dart';
import 'package:econoris_app/ui/core/ui/categories/widgets/category_picker_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Form field to choose the category of an operation or of a subscription.
/// It shows the chosen category with its main category, and opens the category picker when tapped.
class CategoryField extends ConsumerWidget {
  const CategoryField({
    super.key,
    required this.selectedCategoryId,
    required this.isExpense,
    required this.onCategorySelected,
  });

  final int? selectedCategoryId;

  /// Whether the operation is an expense: the picker suggests the categories of the expenses, or of the incomes.
  final bool isExpense;
  final ValueChanged<int> onCategorySelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCatalog = ref.watch(categoryViewModelProvider);
    final suggestedCategoryIds = ref.watch(
      suggestedCategoryIdsProvider(isExpense),
    );

    return asyncCatalog.when(
      data: (catalog) => _CategoryFormField(
        catalog: catalog,
        selectedCategoryId: selectedCategoryId,
        suggestedCategoryIds: suggestedCategoryIds,
        onCategorySelected: onCategorySelected,
      ),
      loading: () => const _CategoryFieldMessage(
        message: 'Chargement des catégories…',
        isLoading: true,
      ),
      error: (_, _) => _CategoryFieldMessage(
        message: 'Impossible de charger les catégories.',
        onRetry: () => ref.read(categoryViewModelProvider.notifier).refresh(),
      ),
    );
  }
}

/// The category field, once the categories are loaded.
class _CategoryFormField extends StatelessWidget {
  const _CategoryFormField({
    required this.catalog,
    required this.selectedCategoryId,
    required this.suggestedCategoryIds,
    required this.onCategorySelected,
  });

  final CategoryCatalog catalog;
  final int? selectedCategoryId;
  final List<int> suggestedCategoryIds;
  final ValueChanged<int> onCategorySelected;

  Future<void> _openCategoryPicker(BuildContext context) async {
    /* Closes the keyboard of the previous field, which would hide the picker */
    FocusScope.of(context).unfocus();

    final chosenCategoryId = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (_) => CategoryPickerSheet(
        catalog: catalog,
        selectedCategoryId: selectedCategoryId,
        suggestedCategoryIds: suggestedCategoryIds,
      ),
    );

    if (chosenCategoryId == null) {
      return;
    }

    onCategorySelected(chosenCategoryId);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      /* A new state for every new category: it takes the category restored from a draft,
         and clears the "missing category" error as soon as a category is chosen */
      key: ValueKey(selectedCategoryId),
      initialValue: selectedCategoryId,

      /* A category that is not in the catalog anymore, from an old draft for instance, must be chosen again */
      validator: (categoryId) => catalog.findById(categoryId) == null
          ? 'La catégorie est obligatoire'
          : null,
      builder: (field) {
        final selectedCategory = catalog.findById(field.value);

        return InkWell(
          onTap: () => _openCategoryPicker(context),
          borderRadius: BorderRadius.circular(4),
          child: InputDecorator(
            isEmpty: selectedCategory == null,
            decoration: InputDecoration(
              labelText: 'Catégorie',
              border: const OutlineInputBorder(),
              errorText: field.errorText,
              prefixIcon: selectedCategory == null
                  ? null
                  : Icon(categoryIconOf(catalog, selectedCategory)),
              suffixIcon: const Icon(Icons.arrow_drop_down),
            ),
            child: selectedCategory == null
                ? null
                : Text(
                    categoryFullLabelOf(catalog, selectedCategory.id),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
        );
      },
    );
  }
}

/// Shown in place of the category field while the categories load, or when they cannot be loaded.
class _CategoryFieldMessage extends StatelessWidget {
  const _CategoryFieldMessage({
    required this.message,
    this.isLoading = false,
    this.onRetry,
  });

  final String message;
  final bool isLoading;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: 'Catégorie',
        border: const OutlineInputBorder(),
        errorText: onRetry == null ? null : message,
      ),
      child: Row(
        children: [
          if (isLoading) ...[
            const SizedBox.square(
              dimension: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
            const SizedBox(width: 12),
            Expanded(child: Text(message)),
          ],
          if (onRetry != null)
            TextButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Réessayer'),
            ),
        ],
      ),
    );
  }
}
