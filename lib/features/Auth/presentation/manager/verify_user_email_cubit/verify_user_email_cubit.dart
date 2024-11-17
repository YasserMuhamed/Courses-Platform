import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'verify_user_email_state.dart';

class VerifyUserEmailCubit extends Cubit<VerifyUserEmailState> {
  VerifyUserEmailCubit(this.authRepo) : super(VerifyUserEmailInitial());
  final AuthRepo authRepo;

  Future<void> verifyUser(String email) async {
    emit(VerifyUserEmailLoading());
    final response = await authRepo.verifyUserSendEmail(email);

    response.fold(
      (l) => emit(VerifyUserEmailFailure(l.error)),
      (r) => emit(VerifyUserEmailSuccess(r)),
    );
  }
}
