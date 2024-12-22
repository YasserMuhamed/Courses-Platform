import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_third_cubit/forget_password_reset_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/pages/forget_password_third_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordConfirmButton extends StatelessWidget {
  const ResetPasswordConfirmButton({
    super.key,
    required this.confirmNewPasswordFormKey,
    required this.widget,
    required this.passwordController,
    required this.setAutoValidateMode,
  });

  final GlobalKey<FormState> confirmNewPasswordFormKey;
  final ForgetPasswordThirdPage widget;
  final TextEditingController passwordController;
  final ValueChanged<AutovalidateMode> setAutoValidateMode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordResetCubit, ForgetPasswordResetState>(
      listenWhen: (previous, current) =>
          current is ForgetPasswordResetSuccess ||
          current is ForgetPasswordResetFailure ||
          current is ForgetPasswordResetLoading,
      listener: (context, state) {
        if (state is ForgetPasswordResetSuccess) {
          ToastHelper()
              .showSuccessToast(context, "password-reset-success".tr());
          GoRouter.of(context).go(AppRoutes.kLoginPage);
        } else if (state is ForgetPasswordResetFailure) {
          ToastHelper().showErrorToast(context, state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is ForgetPasswordResetSuccess ||
          current is ForgetPasswordResetFailure ||
          current is ForgetPasswordResetLoading,
      builder: (context, state) {
        return MyButton(
            text: (state is ForgetPasswordResetLoading)
                ? "loading".tr()
                : "reset-password".tr(),
            onTap: () {
              if (confirmNewPasswordFormKey.currentState!.validate()) {
                context.read<ForgetPasswordResetCubit>().passwordReset(
                    EmailAndOtpModel(
                      email: widget.request.email,
                      code: widget.request.code,
                    ),
                    passwordController.text);
              } else {
                setAutoValidateMode(AutovalidateMode.onUserInteraction);
              }
            });
      },
    );
  }
}
