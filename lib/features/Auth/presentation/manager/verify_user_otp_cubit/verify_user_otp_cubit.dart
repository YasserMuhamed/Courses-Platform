import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:equatable/equatable.dart';

part 'verify_user_otp_state.dart';

class VerifyUserOtpCubit extends Cubit<VerifyUserOtpState> {
  VerifyUserOtpCubit(this.authRepo) : super(VerifyUserOtpInitial());
  final AuthRepo authRepo;
  Future<void> verifyUser(EmailAndOtpModel request) async {
    emit(VerifyUserOtpLoading());
    final response = await authRepo.verifyUserSendOTP(request);
    response.fold(
      (l) => emit(VerifyUserOtpFailure(l.error)),
      (r) => emit(VerifyUserOtpSuccess(r)),
    );
  }
}
