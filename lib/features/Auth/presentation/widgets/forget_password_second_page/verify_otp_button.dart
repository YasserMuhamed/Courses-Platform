import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_second_cubit/forget_password_otp_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class VerifyOTPButton extends StatelessWidget {
  const VerifyOTPButton({
    super.key,
    required this.email,
    required this.otpCode,
  });

  final String email;
  final String otpCode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: BlocConsumer<ForgetPasswordOtpCubit, ForgetPasswordOtpState>(
        listenWhen: (previous, current) =>
            current is ForgetPasswordOTPSuccess ||
            current is ForgetPasswordOTPFailure ||
            current is ForgetPasswordOTPLoading,
        listener: (context, state) {
          if (state is ForgetPasswordOTPSuccess) {
            if (state.status == true) {
              ToastHelper().showSuccessToast(context, "otp-verified".tr());
              GoRouter.of(context).push(AppRoutes.kForgetPasswordThirdPage,
                  extra:
                      EmailAndOtpModel(email: email, code: int.parse(otpCode)));
            } else {
              ToastHelper().showErrorToast(context, "otp-incorrect".tr());
            }
          } else if (state is ForgetPasswordOTPFailure) {
            ToastHelper().showErrorToast(context, "otp-incorrect".tr());
          }
        },
        buildWhen: (previous, current) =>
            current is ForgetPasswordOTPSuccess ||
            current is ForgetPasswordOTPFailure ||
            current is ForgetPasswordOTPLoading,
        builder: (context, state) {
          return MyButton(
              text: (state is ForgetPasswordOTPLoading)
                  ? "loading".tr()
                  : "verify-otp".tr(),
              onTap: () {
                print(
                    "$otpCode-----------------------------${otpCode.length}--------------");
                if (otpCode.length == 6) {
                  EmailAndOtpModel request = EmailAndOtpModel(
                    email: email,
                    code: int.parse(otpCode),
                  );
                  context
                      .read<ForgetPasswordOtpCubit>()
                      .forgetPasswordOTP(request);
                  print("$otpCode-------------------------------------------");
                } else {
                  ToastHelper().showErrorToast(context, "otp-incorrect".tr());
                }
              });
        },
      ),
    );
  }
}
