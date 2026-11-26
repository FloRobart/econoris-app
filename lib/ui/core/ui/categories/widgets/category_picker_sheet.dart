import 'package:econoris_app/domain/models/categories/category.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:econoris_app/ui/core/ui/categories/category_display.dart';
import 'package:flutter/material.dart';

/// Bottom sheet to choose a category among many.
/// Without search, it shows the categories the user chooses the most, then every main category,
/// which unfolds to show its sub-categories. Typing in the search field lists the matching categories.
/// The sheet closes with the id of the chosen category.
class CategoryPickerSheet extends StatefulWidget {
  const CategoryPickerSheet({
    super.key,
    required this.catalog,
    required this.selectedCategoryId,
    required this.suggestedCategoryIds,
  });

  final CategoryCatalog catalog;
  final int? selectedCategoryId;
  final List<int> suggestedCategoryIds;

  @override
  State<CategoryPickerSheet> createState() => _CategoryPickerSheetState();
}

class _CategoryPickerSheetState extends State<CategoryPickerSheet> {
  final TextEditingController _searchController = TextEditingController();

  String get _query => _searchController.text.trim();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onQueryChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onQueryChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onQueryChanged() {
    setState(() {});
  }

  void _chooseCategory(Category category) {
    Navigator.of(context).pop(category.id);
  }

  /// Validating the search chooses its best result, so that a category can be chosen with the keyboard only.
  void _chooseBestSearchResult() {
    final searchResults = widget.catalog.search(_query);
    if (searchResults.isEmpty) {
      return;
    }

    _chooseCategory(searchResults.first);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Choisir une catégorie', style: theme.textTheme.titleLarge),

            const SizedBox(height: 12),

            TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _chooseBestSearchResult(),
              decoration: InputDecoration(
                hintText: 'Rechercher : loyer, essence, Netflix…',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        tooltip: 'Effacer la recherche',
                        icon: const Icon(Icons.clear),
                        onPressed: _searchController.clear,
                      ),
                border: const OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 8),

            Expanded(
              child: _query.isEmpty
                  ? _CategoryBrowser(
                      catalog: widget.catalog,
                      selectedCategoryId: widget.selectedCategoryId,
                      suggestedCategoryIds: widget.suggestedCategoryIds,
                      onCategoryChosen: _chooseCategory,
                    )
                  : _CategorySearchResults(
                      catalog: widget.catalog,
                      query: _query,
                      selectedCategoryId: widget.selectedCategoryId,
                      onCategoryChosen: _chooseCategory,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

/// The categories without search: the most used ones, then every main category with its sub-categories.
class _CategoryBrowser extends StatelessWidget {
  const _CategoryBrowser({
    required this.catalog,
    required this.selectedCategoryId,
    required this.suggestedCategoryIds,
    required this.onCategoryChosen,
  });

  final CategoryCatalog catalog;
  final int? selectedCategoryId;
  final List<int> suggestedCategoryIds;
  final ValueChanged<Category> onCategoryChosen;

  @override
  Widget build(BuildContext context) {
    final suggestedCategories = suggestedCategoryIds
        .map(catalog.findById)
        .whereType<Category>()
        .toList();

    return ListView(
      children: [
        if (suggestedCategories.isNotEmpty) ...[
          const _SectionTitle(title: 'Les plus utilisées'),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final suggestedCategory in suggestedCategories)
                ChoiceChip(
                  avatar: Icon(categoryIconOf(catalog, suggestedCategory)),
                  label: Text(suggestedCategory.label),
                  selected: suggestedCategory.id == selectedCategoryId,
                  onSelected: (_) => onCategoryChosen(suggestedCategory),
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],

        const _SectionTitle(title: 'Toutes les catégories'),

        for (final mainCategory in catalog.mainCategories)
          _MainCategoryTile(
            catalog: catalog,
            mainCategory: mainCategory,
            selectedCategoryId: selectedCategoryId,
            onCategoryChosen: onCategoryChosen,
          ),
      ],
    );
  }
}

/// A main category, which unfolds to show its sub-categories.
/// The main category itself can be chosen, for the users who do not want to go into detail.
class _MainCategoryTile extends StatelessWidget {
  const _MainCategoryTile({
    required this.catalog,
    required this.mainCategory,
    required this.selectedCategoryId,
    required this.onCategoryChosen,
  });

  final CategoryCatalog catalog;
  final Category mainCategory;
  final int? selectedCategoryId;
  final ValueChanged<Category> onCategoryChosen;

  @override
  Widget build(BuildContext context) {
    final IconData mainCategoryIcon = categoryIconOf(catalog, mainCategory);

    if (mainCategory.children.isEmpty) {
      return _CategoryTile(
        category: mainCategory,
        leadingIcon: mainCategoryIcon,
        isSelected: mainCategory.id == selectedCategoryId,
        onCategoryChosen: onCategoryChosen,
      );
    }

    /* The main category of the chosen category starts unfolded, to show where the choice is */
    final bool containsSelectedCategory =
        selectedCategoryId != null &&
        catalog.belongsToAny(selectedCategoryId!, {mainCategory.code});

    return ExpansionTile(
      leading: Icon(mainCategoryIcon),
      title: Text(mainCategory.label),
      subtitle: Text('${mainCategory.children.length} sous-catégories'),
      initiallyExpanded: containsSelectedCategory,
      shape: const Border(),
      childrenPadding: const EdgeInsets.only(left: 24),
      children: [
        _CategoryTile(
          category: mainCategory,
          subtitle: 'Sans préciser de sous-catégorie',
          isSelected: mainCategory.id == selectedCategoryId,
          onCategoryChosen: onCategoryChosen,
        ),
        for (final subCategory in mainCategory.children)
          _CategoryTile(
            category: subCategory,
            isSelected: subCategory.id == selectedCategoryId,
            onCategoryChosen: onCategoryChosen,
          ),
      ],
    );
  }
}

/// The categories that match the search, the best matches first.
class _CategorySearchResults extends StatelessWidget {
  const _CategorySearchResults({
    required this.catalog,
    required this.query,
    required this.selectedCategoryId,
    required this.onCategoryChosen,
  });

  final CategoryCatalog catalog;
  final String query;
  final int? selectedCategoryId;
  final ValueChanged<Category> onCategoryChosen;

  @override
  Widget build(BuildContext context) {
    final searchResults = catalog.search(query);

    if (searchResults.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 24),
        child: Text(
          'Aucune catégorie ne correspond à « $query ».',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
    }

    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        final category = searchResults[index];
        final parent = catalog.findParent(category);

        return _CategoryTile(
          category: category,
          leadingIcon: categoryIconOf(catalog, category),
          subtitle: parent?.label ?? 'Catégorie principale',
          isSelected: category.id == selectedCategoryId,
          onCategoryChosen: onCategoryChosen,
        );
      },
    );
  }
}

/// A category that can be chosen, marked when it is the chosen one.
class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.category,
    required this.isSelected,
    required this.onCategoryChosen,
    this.leadingIcon,
    this.subtitle,
  });

  final Category category;
  final bool isSelected;
  final ValueChanged<Category> onCategoryChosen;
  final IconData? leadingIcon;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leadingIcon == null ? null : Icon(leadingIcon),
      title: Text(category.label),
      subtitle: subtitle == null ? null : Text(subtitle!),
      trailing: isSelected ? const Icon(Icons.check) : null,
      selected: isSelected,
      onTap: () => onCategoryChosen(category),
    );
  }
}

/// Title of a section of the category picker.
class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Text(
        title,
        style: theme.textTheme.titleSmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
