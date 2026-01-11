import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hungry_app/core/constants/api_endpoints.dart';
import 'package:hungry_app/core/constants/app_strings.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_error_handler.dart';
import 'package:hungry_app/core/network/apiClient.dart';
import 'package:hungry_app/core/utils/storage_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient implements ApiClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        validateStatus: (status) => status != null && status < 500,
        headers: {"Content-Type": "application/json"},
      ),
    );
    _dio.interceptors.addAll([_authInterceptors(), _loggerInterceptor()]);
  }

  InterceptorsWrapper _authInterceptors() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final String? token = await SecureStorage.getData(StorageKeys.token);
        if (token != null && token.isNotEmpty) {
          options.headers["Authorization"] = "Bearer $token";
        }
        return handler.next(options);
      },
    );
  }

  PrettyDioLogger _loggerInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
      enabled: kDebugMode,
    );
  }

  @override
  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await _dio.get(endPoint, queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      ApiErrorHandler.handler(e);
      rethrow;
    }
  }

  @override
  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await _dio.post(endPoint, data: data);
      // log(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      // log(e.toString());
      ApiErrorHandler.handler(e);
      rethrow;
    }
  }

  @override
  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await _dio.put(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      ApiErrorHandler.handler(e);
      rethrow;
    }
  }

  @override
  Future<dynamic> delete({
    required String endPoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final Response response = await _dio.delete(endPoint, data: data);
      return response.data;
    } on DioException catch (e) {
      ApiErrorHandler.handler(e);
      rethrow;
    }
  }
}
