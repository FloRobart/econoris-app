import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';

/// A category of the operations and the subscriptions.
/// A main category has no parent and holds its sub-categories in [children].
/// Any category can be chosen, a main category included.
@freezed
abstract class Category with _$Category {
  const factory Category({
    required int id,

    /// Stable identifier, used by the logic of the application: unlike the label, it never changes.
    required String code,
    required String label,
    required int? parentId,

    /// Words that find the category in a search although its label does not contain them:
    /// "essence" finds "Carburant et recharge".
    @Default(<String>[]) List<String> searchKeywords,
    @Default(<Category>[]) List<Category> children,
  }) = _Category;
}
