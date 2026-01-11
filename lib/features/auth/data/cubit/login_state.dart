part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

// !login State
class LoginLoding extends LoginState {}

class LoginSuccess extends LoginState {
  final AuthModel data;
  LoginSuccess(this.data);
}

class LoginError extends LoginState {
  final ApiErrorModel massege;
  LoginError(this.massege);
}

// !Signup state

class SignupLoding extends LoginState {}

class SignupSuccess extends LoginState {
  final AuthModel data;
  SignupSuccess(this.data);
}

class SignupError extends LoginState {
  final ApiErrorModel massege;
  SignupError(this.massege);
}
