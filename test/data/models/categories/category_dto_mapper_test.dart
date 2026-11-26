import 'package:econoris_app/data/models/categories/category_dto.dart';
import 'package:econoris_app/data/models/categories/category_dto_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Raw JSON of a main category, as returned by GET /categories
  final Map<String, dynamic> housingJson = {
    'id': 2,
    'code': 'housing',
    'label': 'Logement',
    'parent_id': null,
    'children': [
      {
        'id': 35,
        'code': 'housing_rent',
        'label': 'Loyer',
        'parent_id': 2,
        'search_keywords': ['bail', 'propriétaire'],
        'children': [],
      },
    ],
  };

  group('CategoryDto.fromJson', () {
    test('parses a main category with its sub-categories', () {
      final categoryDto = CategoryDto.fromJson(housingJson);

      expect(categoryDto.parentId, isNull);
      expect(categoryDto.children, hasLength(1));
      expect(categoryDto.children.first.parentId, 2);
    });

    test('accepts a category without children nor keywords keys', () {
      final categoryDto = CategoryDto.fromJson({
        'id': 21,
        'code': 'other',
        'label': 'Autres',
        'parent_id': null,
      });

      expect(categoryDto.children, isEmpty);
      expect(categoryDto.searchKeywords, isEmpty);
    });
  });

  group('CategoryDtoMapper.toDomain', () {
    test('converts the category and its sub-categories', () {
      final category = CategoryDto.fromJson(housingJson).toDomain();

      expect(category.code, 'housing');
      expect(category.children.single.label, 'Loyer');
      expect(category.children.single.parentId, category.id);
      expect(category.children.single.searchKeywords, ['bail', 'propriétaire']);
    });
  });
}
