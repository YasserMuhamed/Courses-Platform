part of 'verify_user_otp_cubit.dart';

sealed class VerifyUserOtpState extends Equatable {
  const VerifyUserOtpState();

  @override
  List<Object> get props => [];
}

final class VerifyUserOtpInitial extends VerifyUserOtpState {}

final class VerifyUserOtpLoading extends VerifyUserOtpState {}

final class VerifyUserOtpSuccess extends VerifyUserOtpState {
  final String message;

  const VerifyUserOtpSuccess(this.message);
}

final class VerifyUserOtpFailure extends VerifyUserOtpState {
  final String error;

  const VerifyUserOtpFailure(this.error);
}
