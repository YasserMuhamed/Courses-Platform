import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/models/forget_password_second_request.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'forget_password_reset_state.dart';

class ForgetPasswordResetCubit extends Cubit<ForgetPasswordResetState> {
  ForgetPasswordResetCubit(this.authRepo) : super(ForgetPasswordResetInitial());
  final AuthRepo authRepo;

  Future<void> passwordReset(
      ForgetPasswordSecondRequest request, String newPassword) async {
    emit(ForgetPasswordResetLoading());
    final response = await authRepo.passwordReset(request, newPassword);
    response.fold(
      (l) => emit(ForgetPasswordResetFailure(l.error)),
      (r) => emit(ForgetPasswordResetSuccess(r)),
    );
  }
}
