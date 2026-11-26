import 'package:econoris_app/domain/models/categories/category.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:flutter/material.dart';

/// Icons of the main categories, by code. A sub-category shows the icon of its main category.
const Map<String, IconData> _mainCategoryIcons = {
  'income': Icons.payments_outlined,
  'housing': Icons.home_outlined,
  'food': Icons.restaurant_outlined,
  'transport': Icons.directions_car_outlined,
  'health': Icons.local_hospital_outlined,
  'shopping': Icons.shopping_bag_outlined,
  'high_tech': Icons.devices_outlined,
  'leisure': Icons.local_activity_outlined,
  'travel': Icons.flight_outlined,
  'family': Icons.family_restroom_outlined,
  'pets': Icons.pets_outlined,
  'education': Icons.school_outlined,
  'work': Icons.work_outline,
  'beauty': Icons.spa_outlined,
  'bank': Icons.account_balance_outlined,
  'taxes': Icons.receipt_long_outlined,
  'savings': Icons.savings_outlined,
  'investment': Icons.trending_up,
  'gifts': Icons.card_giftcard_outlined,
  'transfers': Icons.swap_horiz,
  'other': Icons.more_horiz,
};

/// Icon of a category whose main category has no icon of its own.
const IconData _defaultCategoryIcon = Icons.label_outline;

/// Shown when the category of an operation is not in the catalog (catalog not loaded, or category removed).
const String unknownCategoryLabel = 'Catégorie inconnue';

/// The icon of a category: the icon of its main category.
IconData categoryIconOf(CategoryCatalog catalog, Category? category) {
  Category? mainCategory = category;
  while (mainCategory != null && mainCategory.parentId != null) {
    mainCategory = catalog.findParent(mainCategory);
  }

  return _mainCategoryIcons[mainCategory?.code] ?? _defaultCategoryIcon;
}

/// The label of a category, after the label of its parent: "Logement › Loyer".
String categoryFullLabelOf(CategoryCatalog catalog, int? categoryId) {
  final category = catalog.findById(categoryId);
  if (category == null) {
    return unknownCategoryLabel;
  }

  final parent = catalog.findParent(category);
  if (parent == null) {
    return category.label;
  }

  return '${parent.label} › ${category.label}';
}
