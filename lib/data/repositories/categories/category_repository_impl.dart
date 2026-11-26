import 'package:econoris_app/data/models/categories/category_dto_mapper.dart';
import 'package:econoris_app/data/repositories/categories/category_repository.dart';
import 'package:econoris_app/data/repositories/categories/category_repository_remote.dart';
import 'package:econoris_app/domain/models/categories/category.dart';

/// Repository of the categories, read from the remote API.
class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl({required this.remote});

  final CategoryRepositoryRemote remote;

  /// Fetches the main categories, each with its sub-categories.
  @override
  Future<List<Category>> getCategories() async {
    final categoriesDtoList = await remote.getCategories();

    return categoriesDtoList
        .map((categoryDto) => categoryDto.toDomain())
        .toList();
  }
}
