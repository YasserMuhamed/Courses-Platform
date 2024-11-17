import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/shared_pref_helper.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/features/Auth/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:courses_platform/features/Auth/data/models/login_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AutovalidateMode autovalidateMode;
  final ValueChanged<AutovalidateMode> setAutovalidateMode;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.autovalidateMode,
    required this.setAutovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) {
        return current is AuthLoginFailure ||
            current is AuthLoginLoading ||
            current is AuthLoginSuccess;
      },
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          ToastHelper().showSuccessToast(context, "success-login".tr());
          SharedPrefHelper.setSecuredString(
              "userToken", state.loginResponse.data!.token!);
          hasToken = true;
          isAuthorized = true;

          if (state.loginResponse.data!.user!.emailVerifiedAt == null) {
            GoRouter.of(context).go(AppRoutes.kVerifyFirstPage);
          } else {
            GoRouter.of(context).go(AppRoutes.kHomePage);
            isVerified = true;
          }
        } else if (state is AuthLoginFailure) {
          ToastHelper().showErrorToast(context, state.error);
        }
      },
      buildWhen: (previous, current) {
        return current is AuthLoginFailure ||
            current is AuthLoginLoading ||
            current is AuthLoginSuccess;
      },
      builder: (context, state) {
        return MyButton(
          text: (state is AuthLoginLoading)
              ? tr("loading".tr())
              : tr("sign-in".tr()),
          onTap: () {
            LoginRequest loginRequest = LoginRequest(
              email: emailController.text,
              password: passwordController.text,
            );
            if (formKey.currentState!.validate()) {
              context.read<LoginCubit>().loginUsers(loginRequest);
            } else {
              setAutovalidateMode(AutovalidateMode.onUserInteraction);
            }
          },
        );
      },
    );
  }
}
