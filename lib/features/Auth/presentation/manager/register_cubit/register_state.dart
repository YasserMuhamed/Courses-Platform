part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitial extends RegisterState {}

class AuthRegisterLoading extends RegisterState {}

class AuthRegisterSuccess extends RegisterState {
  final RegisterResponse registerResponse;
  const AuthRegisterSuccess(this.registerResponse);
}

class AuthRegisterFailure extends RegisterState {
  final String error;

  const AuthRegisterFailure(this.error);
}
