part of 'forget_password_otp_cubit.dart';

sealed class ForgetPasswordOtpState extends Equatable {
  const ForgetPasswordOtpState();

  @override
  List<Object> get props => [];
}

final class ForgetPasswordOtpInitial extends ForgetPasswordOtpState {}

final class ForgetPasswordOTPLoading extends ForgetPasswordOtpState {}

final class ForgetPasswordOTPSuccess extends ForgetPasswordOtpState {
  final String message;

  const ForgetPasswordOTPSuccess(this.message);
}

final class ForgetPasswordOTPFailure extends ForgetPasswordOtpState {
  final String error;

  const ForgetPasswordOTPFailure(this.error);
}
