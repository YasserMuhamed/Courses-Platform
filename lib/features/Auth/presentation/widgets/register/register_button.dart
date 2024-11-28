import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/api/dio_factory.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/shared_pref_helper.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:courses_platform/features/Auth/data/models/register_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class RegisterButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final AutovalidateMode autovalidateMode;
  final ValueChanged<AutovalidateMode> setAutovalidateMode;

  const RegisterButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nameController,
    required this.phoneController,
    required this.autovalidateMode,
    required this.setAutovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) {
        return current is AuthRegisterFailure ||
            current is AuthRegisterLoading ||
            current is AuthRegisterSuccess;
      },
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          ToastHelper().showSuccessToast(context, "register-success".tr());
          SharedPrefHelper.setSecuredString(
              "userToken", state.registerResponse.data!.token!);
          DioFactory.setTokenIntoHeaderAfterLogin(
              state.registerResponse.data!.token!);
          hasToken = true;
          isAuthorized = true;
          GoRouter.of(context)
              .push(AppRoutes.kVerifySecondPage, extra: emailController.text);
        } else if (state is AuthRegisterFailure) {
          ToastHelper().showErrorToast(context, state.error);
        }
      },
      buildWhen: (previous, current) {
        return current is AuthRegisterFailure ||
            current is AuthRegisterLoading ||
            current is AuthRegisterSuccess;
      },
      builder: (context, state) {
        return MyButton(
          text: (state is AuthRegisterLoading)
              ? tr("loading".tr())
              : tr("sign-up".tr()),
          onTap: () {
            RegisterRequest registerRequest = RegisterRequest(
              email: emailController.text,
              password: passwordController.text,
              passwordConfirmation: confirmPasswordController.text,
              name: nameController.text,
              phone: phoneController.text,
              facultyId: 1,
            );
            if (formKey.currentState!.validate()) {
              context.read<RegisterCubit>().registerUsers(registerRequest);
            } else {
              setAutovalidateMode(AutovalidateMode.onUserInteraction);
            }
          },
        );
      },
    );
  }
}
