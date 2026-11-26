import 'package:econoris_app/data/models/categories/category_dto.dart';
import 'package:econoris_app/domain/models/categories/category.dart';

extension CategoryDtoMapper on CategoryDto {
  /// Converts the category and all its sub-categories.
  Category toDomain() {
    return Category(
      id: id,
      code: code,
      label: label,
      parentId: parentId,
      searchKeywords: searchKeywords,
      children: children
          .map((childCategoryDto) => childCategoryDto.toDomain())
          .toList(),
    );
  }
}
