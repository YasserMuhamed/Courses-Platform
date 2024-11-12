part of 'auth_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends LoginState {}

class AuthLoginLoading extends LoginState {}

class AuthLoginSuccess extends LoginState {
  final LoginResponse loginResponse;

  const AuthLoginSuccess({required this.loginResponse});
}

class AuthLoginFailure extends LoginState {
  final String error;

  const AuthLoginFailure(this.error);
}
