import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_first_cubit/forget_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SendOTPButton extends StatelessWidget {
  const SendOTPButton({
    super.key,
    required this.emailController,
    required this.forgetPasswordFormKey,
    required this.setAutovalidateMode,
  });

  final TextEditingController emailController;
  final GlobalKey<FormState> forgetPasswordFormKey;
  final ValueChanged<AutovalidateMode> setAutovalidateMode;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listenWhen: (previous, current) =>
          current is ForgetPasswordSuccess ||
          current is ForgetPasswordFailure ||
          current is ForgetPasswordLoading,
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          ToastHelper()
              .showSuccessToast(context, "reset-password-link-sent".tr());
          GoRouter.of(context).push(AppRoutes.kForgetPasswordSecondPage,
              extra: emailController.text);
        } else if (state is ForgetPasswordFailure) {
          ToastHelper().showErrorToast(context, state.error);
        }
      },
      builder: (context, state) {
        return MyButton(
            text: (state is ForgetPasswordLoading)
                ? "loading".tr()
                : "reset-password".tr(),
            onTap: () {
              if (forgetPasswordFormKey.currentState!.validate()) {
                // GoRouter.of(context).push(
                //     AppRoutes.kForgetPasswordSecondPage,
                //     extra: email);
                BlocProvider.of<ForgetPasswordCubit>(context)
                    .forgetPassword(emailController.text);
              } else {
                setAutovalidateMode(AutovalidateMode.onUserInteraction);
              }
            });
      },
    );
  }
}
