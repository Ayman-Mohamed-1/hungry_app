import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/core/network/api%20error%20handler/api_error_model.dart';
import 'package:hungry_app/features/auth/data/models/login_model.dart';
import 'package:hungry_app/features/auth/data/repos/AuthRepo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authrepo) : super(LoginInitial());
  final AuthRepo authrepo;

  login({required String email, required String password}) async {
    emit(LoginLoding());
    final Either<ApiErrorModel, AuthModel?> res = await authrepo.login(
      email: email,
      password: password,
    );

    res.fold(
      (e) => emit(LoginError(e)),
      (data) => emit(LoginSuccess(data as AuthModel)),
    );
  }

  signup({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(SignupLoding());
    final Either<ApiErrorModel, AuthModel?> res = await authrepo.signup(
      email: email,
      password: password,
      name: name,
    );

    res.fold(
      (e) => emit(SignupError(e)),
      (data) => emit(SignupSuccess(data as AuthModel)),
    );
  }
}
