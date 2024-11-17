import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_third_cubit/forget_password_reset_cubit.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/bottom_slider.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordThirdPage extends StatefulWidget {
  const ForgetPasswordThirdPage({
    super.key,
    required this.request,
  });
  final EmailAndOtpModel request;
  @override
  State<ForgetPasswordThirdPage> createState() =>
      _ForgetPasswordThirdPageState();
}

class _ForgetPasswordThirdPageState extends State<ForgetPasswordThirdPage> {
  GlobalKey<FormState> confirmNewPasswordFormKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;

  PageController pageController = PageController(initialPage: 2);
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: confirmNewPasswordFormKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 75.h),
                  const Center(
                    child:
                        SvgIcon(path: "assets/SVGs/keyboard-svgrepo-com.svg"),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      'set-new-password'.tr(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Text(
                      "must-be-8-chars".tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: AppColors.darkGrey),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Text(
                    "password".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  AppTextField(
                    validator: (value) =>
                        AppValidators.passwordValidator(value),
                    controller: passwordController,
                    hintText: "new-password".tr(),
                    obscureText: isObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: isObscure
                          ? Icon(
                              Icons.visibility_off,
                              size: 22.sp,
                            )
                          : Icon(
                              Icons.visibility,
                              size: 22.sp,
                            ),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "confirm-password".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  AppTextField(
                    validator: (value) =>
                        AppValidators.confirmPasswordValidator(
                            value, passwordController.text),
                    controller: passwordConfirmationController,
                    hintText: "new-password-confirm".tr(),
                    obscureText: isObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: isObscure
                          ? Icon(
                              Icons.visibility_off,
                              size: 22.sp,
                            )
                          : Icon(
                              Icons.visibility,
                              size: 22.sp,
                            ),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 30.h),
                  BlocConsumer<ForgetPasswordResetCubit,
                      ForgetPasswordResetState>(
                    listenWhen: (previous, current) =>
                        current is ForgetPasswordResetSuccess ||
                        current is ForgetPasswordResetFailure ||
                        current is ForgetPasswordResetLoading,
                    listener: (context, state) {
                      if (state is ForgetPasswordResetSuccess) {
                        ToastHelper().showSuccessToast(
                            context, "password-reset-success".tr());
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
                            if (confirmNewPasswordFormKey.currentState!
                                .validate()) {
                              context
                                  .read<ForgetPasswordResetCubit>()
                                  .passwordReset(
                                      EmailAndOtpModel(
                                        email: widget.request.email,
                                        code: widget.request.code,
                                      ),
                                      passwordController.text);
                            } else {
                              setState(() {
                                autovalidateMode =
                                    AutovalidateMode.onUserInteraction;
                              });
                            }
                          });
                    },
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      GoRouter.of(context).go(AppRoutes.kLoginPage);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_rounded,
                            size: 20.sp,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "back-to-login".tr(),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
      bottomNavigationBar: BottomSlider(pageController: pageController),
    );
  }
}
