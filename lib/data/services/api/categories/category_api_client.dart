import 'package:econoris_app/config/app_config.dart';
import 'package:econoris_app/data/services/api/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provides the [CategoryApiClient].
final categoryApiClientProvider = Provider<CategoryApiClient>((ref) {
  return CategoryApiClient(apiClient: ref.read(apiClientProvider));
});

/// Categories-specific API wrapper using the shared [ApiClient] transport.
class CategoryApiClient {
  const CategoryApiClient({required this.apiClient});

  final ApiClient apiClient;

  static final String _baseUrl = '${AppConfig.dataUrl}/categories';

  /// Gets the tree of the categories: the main categories, each with its sub-categories.
  /// The categories are the same for every user.
  Future<List<Map<String, dynamic>>> getCategories() async {
    final response = await apiClient.request(
      HttpMethod.get,
      _baseUrl,
      authenticated: true,
    );

    final dynamic rawData = response.data;

    /* 204 No Content: the server has no category */
    if (rawData == null || rawData == '') {
      return [];
    }

    if (rawData is List) {
      return rawData
          .map((category) => Map<String, dynamic>.from(category as Map))
          .toList();
    }

    throw FormatException(
      'Unexpected categories payload type: ${rawData.runtimeType}',
    );
  }
}
