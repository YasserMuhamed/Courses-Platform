import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.authRepo) : super(ForgetPasswordInitial());
  final AuthRepo authRepo;

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    final response = await authRepo.forgetPasswordSendEmail(email);

    response.fold(
      (l) => emit(ForgetPasswordFailure(l.error)),
      (r) => emit(ForgetPasswordSuccess(r)),
    );
  }
}
