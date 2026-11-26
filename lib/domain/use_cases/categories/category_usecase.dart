import 'package:econoris_app/data/repositories/categories/category_repository.dart';
import 'package:econoris_app/domain/models/categories/category_catalog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the [CategoryUseCase].
final categoryUseCaseProvider = Provider<CategoryUseCase>((ref) {
  return CategoryUseCase(
    categoryRepository: ref.read(categoryRepositoryProvider),
  );
});

/// Use case of the categories.
class CategoryUseCase {
  CategoryUseCase({required this.categoryRepository});

  final CategoryRepository categoryRepository;

  /*=====*/
  /* GET */
  /*=====*/
  /// Fetches every category, ready to be looked up and searched.
  Future<CategoryCatalog> getCategoryCatalog() async {
    final mainCategories = await categoryRepository.getCategories();
    return CategoryCatalog(mainCategories);
  }
}
