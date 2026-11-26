import 'package:econoris_app/data/repositories/categories/category_repository_impl.dart';
import 'package:econoris_app/data/repositories/categories/category_repository_remote.dart';
import 'package:econoris_app/data/services/api/categories/category_api_client.dart';
import 'package:econoris_app/domain/models/categories/category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the [CategoryRepository].
final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  final remote = CategoryRepositoryRemote(
    categoryApiClient: ref.read(categoryApiClientProvider),
  );

  return CategoryRepositoryImpl(remote: remote);
});

/// Repository interface for the categories.
abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
