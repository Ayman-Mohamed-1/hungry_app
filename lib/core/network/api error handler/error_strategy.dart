import 'package:dio/dio.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_error_model.dart';

abstract class ErrorStrategy {
  bool canHandle(DioException exception);
  ApiErrorModel handle(DioException exception);
}
