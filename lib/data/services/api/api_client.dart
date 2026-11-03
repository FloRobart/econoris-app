import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:econoris_app/data/services/auth/auth_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:econoris_app/config/app_config.dart';
import 'package:econoris_app/data/services/interceptors/auth_interceptor.dart';

/// Fournit une instance asynchrone d'[Dio] configurée avec les interceptors nécessaires.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(BaseOptions(baseUrl: AppConfig.dataUrl));
  dio.interceptors.add(
    AuthInterceptor(authNotifier: ref.read(authNotifierProvider.notifier)),
  );
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
});

/// Fournit une instance asynchrone d'[ApiClient].
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(dio: ref.read(dioProvider));
});

/// Enum to represent HTTP methods.
enum HttpMethod { get, post, put, delete }

/// A simple API client that wraps http requests. This is a very basic implementation and can be extended with features like error handling, logging, etc.
class ApiClient {
  const ApiClient({required this._dio});

  final Dio _dio;

  /// A helper method to wrap http requests and handle common logic like adding the Authorization header and checking for 401 responses.
  Future<Response> request(
    HttpMethod method,
    String url, {
    bool authenticated = true,
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
  }) async {
    Response response;
    String stringUri = Uri.parse(url).toString();

    try {
      switch (method) {
        case HttpMethod.get:
          response = await _dio.get(
            stringUri,
            queryParameters: queryParameters,
            options: Options(extra: {'authenticated': authenticated}),
          );
          break;
        case HttpMethod.post:
          response = await _dio.post(
            stringUri,
            data: body == null ? {} : jsonEncode(body),
            queryParameters: queryParameters,
            options: Options(extra: {'authenticated': authenticated}),
          );
          break;
        case HttpMethod.put:
          response = await _dio.put(
            stringUri,
            data: body == null ? {} : jsonEncode(body),
            queryParameters: queryParameters,
            options: Options(extra: {'authenticated': authenticated}),
          );
          break;
        case HttpMethod.delete:
          response = await _dio.delete(
            stringUri,
            queryParameters: queryParameters,
            data: body == null ? {} : jsonEncode(body),
            options: Options(extra: {'authenticated': authenticated}),
          );
          break;
      }
    } on DioException {
      rethrow;
    } catch (e) {
      throw Exception('Failed to make authenticated request: $e');
    }

    return response;
  }
}
