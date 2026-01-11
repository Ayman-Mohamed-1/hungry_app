import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_local_status_Code.dart';
import 'package:hungry_app/core/network/api%20error%20handler/Strategy.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_error_model.dart';

import 'error_strategy.dart';

class ApiErrorHandler {
  static final List<ErrorStrategy> _strategies = [
    ConnectionErrorStrategy(),
    BadCertificateStrategy(),
    CancelErrorStrategy(),
    ConnectionTimeoutStrategy(),
    SendTimeoutStrategy(),
    ReceiveTimeoutStrategy(),
    BadResponseStrategy(),
    UnknownErrorStrategy(),
  ];

  static ApiErrorModel handler(dynamic e) {
    if (e is DioException) {
      for (var strategy in _strategies) {
        if (strategy.canHandle(e)) {
          return strategy.handle(e);
        }
      }
    }

    return ApiErrorModel(
      message: 'Unexpected Error',
      code: ApiLocalStatusCode.unexpectedError,
    );
  }
}
