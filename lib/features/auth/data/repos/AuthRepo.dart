import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hungry_app/core/constants/api_endpoints.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_error_handler.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_error_model.dart';
import 'package:hungry_app/core/network/apiService.dart';
import 'package:hungry_app/core/utils/storage_helper.dart';
import 'package:dartz/dartz.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';

class AuthRepo {
  final ApiService _service;
  AuthRepo(this._service);

  Future<Either<ApiErrorModel, AuthModel?>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _service.postRequest(
        endPoint: ApiEndpoints.login,
        data: {"email": email, "password": password},
      );
      final user = AuthModel.fromJson(response);
      log(user.message.toString());
      //! save token
      if (user.data!.token != null && user.data!.token!.isNotEmpty) {
        await SecureStorage.saveData(key: "token", value: user.data!.token!);
        log(user.data!.token.toString());
      }

      return right(user);
    } on DioException catch (e) {
      log(e.toString());
      return left(ApiErrorHandler.handler(e));
    } catch (e) {
      log(e.toString());
      // print(e);
      return left(ApiErrorHandler.handler(e));
    }
  }

  Future<Either<ApiErrorModel, AuthModel?>> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final response = await _service.postRequest(
        endPoint: ApiEndpoints.register,
        data: {"email": email, "password": password, "name": name},
      );
      final user = AuthModel.fromJson(response);
      log("test error");
      log(user.message.toString());
      //! save token
      if (user.data!.token != null) {
        await SecureStorage.saveData(key: "token", value: user.data!.token!);
        log(user.data!.token.toString());
      }
      return right(user);
    } on DioException catch (e) {
      return left(ApiErrorHandler.handler(e));
    } catch (e) {
      log(e.toString());
      // print(e);
      return left(ApiErrorHandler.handler(e));
    }
  }
}
