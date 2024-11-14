part of 'forget_password_reset_cubit.dart';

sealed class ForgetPasswordResetState extends Equatable {
  const ForgetPasswordResetState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordResetInitial extends ForgetPasswordResetState {}

final class ForgetPasswordResetLoading extends ForgetPasswordResetState {}

final class ForgetPasswordResetSuccess extends ForgetPasswordResetState {
  final String message;

  const ForgetPasswordResetSuccess(this.message);
}

final class ForgetPasswordResetFailure extends ForgetPasswordResetState {
  final String error;

  const ForgetPasswordResetFailure(this.error);
}
