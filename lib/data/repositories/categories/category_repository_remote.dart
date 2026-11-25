import 'package:econoris_app/data/models/categories/category_dto.dart';
import 'package:econoris_app/data/services/api/categories/category_api_client.dart';

/// Reads the categories from the remote API.
class CategoryRepositoryRemote {
  const CategoryRepositoryRemote({required this.categoryApiClient});

  final CategoryApiClient categoryApiClient;

  /// Fetches the main categories, each with its sub-categories.
  Future<List<CategoryDto>> getCategories() async {
    final categories = await categoryApiClient.getCategories();
    return categories.map(CategoryDto.fromJson).toList();
  }
}
