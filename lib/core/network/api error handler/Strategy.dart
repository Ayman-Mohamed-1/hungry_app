import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_local_status_Code.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_error_model.dart';
import 'package:hungry_app/core/network/api%20error%20handler/error_strategy.dart';

class ConnectionErrorStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.connectionError;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Connection Error',
    code: ApiLocalStatusCode.connectionTimeout,
  );
}

class BadCertificateStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.badCertificate;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Bad Certificate',
    code: ApiLocalStatusCode.badCertificate,
  );
}

class CancelErrorStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.cancel;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Request Cancelled',
    code: ApiLocalStatusCode.requestCancelled,
  );
}

class ConnectionTimeoutStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) =>
      e.type == DioExceptionType.connectionTimeout;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Connection Timeout',
    code: ApiLocalStatusCode.connectionTimeout,
  );
}

class SendTimeoutStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.sendTimeout;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Send Timeout',
    code: ApiLocalStatusCode.sendTimeout,
  );
}

class ReceiveTimeoutStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.receiveTimeout;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Receive Timeout',
    code: ApiLocalStatusCode.receiveTimeout,
  );
}

class BadResponseStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.badResponse;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Server Error ${ApiLocalStatusCode.badResponse}',
    code: e.response?.statusCode ?? 26,
  );
}

class UnknownErrorStrategy implements ErrorStrategy {
  @override
  bool canHandle(DioException e) => e.type == DioExceptionType.unknown;

  @override
  ApiErrorModel handle(DioException e) => ApiErrorModel(
    message: 'Unknown Error',
    code: ApiLocalStatusCode.unknownError,
  );
}
