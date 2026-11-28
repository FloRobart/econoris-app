import 'dart:convert';

import 'package:econoris_app/data/services/api/api_client.dart';
import 'package:econoris_app/config/app_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Fournit une instance asynchrone d'[OperationApiClient].
final operationApiClientProvider = Provider<OperationApiClient>((ref) {
  return OperationApiClient(apiClient: ref.read(apiClientProvider));
});

/// Operations-specific API wrapper using the shared [ApiClient] transport.
class OperationApiClient {
  const OperationApiClient({required this.apiClient});

  final ApiClient apiClient;

  static final String _baseUrl = '${AppConfig.dataUrl}/operations';

  /// Get the operations of the current user whose levy day is in the period.
  /// Both bounds are optional and included, as days "yyyy-MM-dd": without them, every operation is returned.
  /// The server is expected to return a list of operations if the JWT is valid.
  Future<List<Map<String, dynamic>>> getOperations({
    String? startDate,
    String? endDate,
  }) async {
    final response = await apiClient.request(
      HttpMethod.get,
      _baseUrl,
      authenticated: true,
      queryParameters: {'start_date': ?startDate, 'end_date': ?endDate},
    );

    /* A period without operation is answered without content: its empty body is not JSON */
    if (response.statusCode == 204) {
      return [];
    }

    final dynamic rawData = response.data;

    if (rawData is String) {
      final decoded = jsonDecode(rawData);
      if (decoded is List) {
        return decoded
            .map((item) => Map<String, dynamic>.from(item as Map))
            .toList();
      }
    }

    if (rawData is List) {
      return rawData
          .map((item) => Map<String, dynamic>.from(item as Map))
          .toList();
    }

    throw FormatException(
      'Unexpected operations payload type: ${rawData.runtimeType}',
    );
  }

  /// Get the levy day of the oldest operation of the current user, as "yyyy-MM-dd".
  /// The server answers without content when the user has no operation.
  Future<String?> getOldestOperationDate() async {
    final response = await apiClient.request(
      HttpMethod.get,
      '$_baseUrl/oldest-date',
      authenticated: true,
    );

    if (response.statusCode == 204) {
      return null;
    }

    final dynamic rawData = response.data;
    final Map<String, dynamic> oldestOperationDate = rawData is String
        ? Map<String, dynamic>.from(jsonDecode(rawData) as Map)
        : Map<String, dynamic>.from(rawData as Map);

    return oldestOperationDate['oldest_levy_date'] as String;
  }

  /// Add a new operation.
  /// The server is expected to return the created operation with its id if the JWT is valid and the request body is correct.
  Future<Map<String, dynamic>> addOperation(Map<String, dynamic> body) async {
    final response = await apiClient.request(
      HttpMethod.post,
      _baseUrl,
      authenticated: true,
      body: body,
    );
    return response.data;
  }

  /// Update an existing operation by id.
  /// The server is expected to return the updated operation if the JWT is valid and the request body is correct.
  Future<Map<String, dynamic>> updateOperation(
    int id,
    Map<String, dynamic> body,
  ) async {
    final response = await apiClient.request(
      HttpMethod.put,
      '$_baseUrl/$id',
      authenticated: true,
      body: body,
    );
    return response.data;
  }

  /// Delete an operation by id.
  /// The server expects DELETE /operations/{operation_id}.
  Future<Map<String, dynamic>> deleteOperation(int id) async {
    final response = await apiClient.request(
      HttpMethod.delete,
      '$_baseUrl/$id',
      authenticated: true,
    );
    return response.data;
  }
}
