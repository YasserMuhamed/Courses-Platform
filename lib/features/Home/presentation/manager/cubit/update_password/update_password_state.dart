part of 'update_password_cubit.dart';

sealed class UpdatePasswordState extends Equatable {
  const UpdatePasswordState();

  @override
  List<Object> get props => [];
}

final class UpdatePasswordInitial extends UpdatePasswordState {}

final class UpdatePasswordLoading extends UpdatePasswordState {}

final class UpdatePasswordSuccess extends UpdatePasswordState {
  final String message;

  const UpdatePasswordSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class UpdatePasswordFailure extends UpdatePasswordState {
  final String message;

  const UpdatePasswordFailure(this.message);

  @override
  List<Object> get props => [message];
}
