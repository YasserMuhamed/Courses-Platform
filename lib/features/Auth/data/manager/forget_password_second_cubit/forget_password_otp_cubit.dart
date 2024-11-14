import 'package:bloc/bloc.dart';
import 'package:courses_platform/features/Auth/data/models/forget_password_second_request.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';

import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'forget_password_otp_state.dart';

class ForgetPasswordOtpCubit extends Cubit<ForgetPasswordOtpState> {
  ForgetPasswordOtpCubit(this.authRepo) : super(ForgetPasswordOtpInitial());
  final AuthRepo authRepo;
  Future<void> forgetPasswordOTP(ForgetPasswordSecondRequest request) async {
    emit(ForgetPasswordOTPLoading());
    final response = await authRepo.forgetPasswordSendOTP(request);
    Logger().i("$response  ResponseForgetPasswordOTP from cubit");
    response.fold(
      (l) => emit(ForgetPasswordOTPFailure(l.error)),
      (r) => emit(ForgetPasswordOTPSuccess(r)),
    );
  }
}
