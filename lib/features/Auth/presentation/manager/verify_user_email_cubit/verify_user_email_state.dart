part of 'verify_user_email_cubit.dart';

sealed class VerifyUserEmailState extends Equatable {
  const VerifyUserEmailState();

  @override
  List<Object> get props => [];
}

final class VerifyUserEmailInitial extends VerifyUserEmailState {}

final class VerifyUserEmailLoading extends VerifyUserEmailState {}

final class VerifyUserEmailSuccess extends VerifyUserEmailState {
  final String message;
  const VerifyUserEmailSuccess(this.message);
}

final class VerifyUserEmailFailure extends VerifyUserEmailState {
  final String error;
  const VerifyUserEmailFailure(this.error);
}
