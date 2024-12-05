import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/toast_helper.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:courses_platform/features/Home/data/models/update_password_request.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/update_password/update_password_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({super.key});

  @override
  State<UpdatePasswordPage> createState() => _UpdatePasswordPageState();
}

class _UpdatePasswordPageState extends State<UpdatePasswordPage> {
  GlobalKey<FormState> confirmNewPasswordFormKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscure = true;
  bool isObscure2 = true;

  PageController pageController = PageController(initialPage: 2);
  TextEditingController currentPasswordController = TextEditingController();
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
                      'reset-password'.tr(),
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
                    "current-password".tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  AppTextField(
                    validator: (value) =>
                        AppValidators.passwordValidator(value),
                    controller: currentPasswordController,
                    hintText: "current-password".tr(),
                    obscureText: isObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: isObscure
                          ? Icon(
                              Icons.visibility_off_outlined,
                              size: 22.sp,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              size: 22.sp,
                            ),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "new-password".tr(),
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
                          isObscure2 = !isObscure2;
                        });
                      },
                      icon: isObscure2
                          ? Icon(
                              Icons.visibility_off_outlined,
                              size: 22.sp,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              size: 22.sp,
                            ),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "new-password-confirm".tr(),
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
                          isObscure2 = !isObscure2;
                        });
                      },
                      icon: isObscure2
                          ? Icon(
                              Icons.visibility_off_outlined,
                              size: 22.sp,
                            )
                          : Icon(
                              Icons.visibility_outlined,
                              size: 22.sp,
                            ),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(height: 30.h),
                  BlocConsumer<UpdatePasswordCubit, UpdatePasswordState>(
                    listenWhen: (previous, current) =>
                        current is UpdatePasswordSuccess ||
                        current is UpdatePasswordFailure ||
                        current is UpdatePasswordLoading,
                    listener: (context, state) {
                      if (state is UpdatePasswordSuccess) {
                        ToastHelper().showSuccessToast(context, state.message);
                        GoRouter.of(context).pop();
                      } else if (state is UpdatePasswordFailure) {
                        ToastHelper().showErrorToast(context, state.message);
                      }
                    },
                    buildWhen: (previous, current) =>
                        current is UpdatePasswordSuccess ||
                        current is UpdatePasswordFailure ||
                        current is UpdatePasswordLoading,
                    builder: (context, state) {
                      return MyButton(
                          text: (state is UpdatePasswordLoading)
                              ? "loading".tr()
                              : "reset-password".tr(),
                          onTap: () {
                            if (confirmNewPasswordFormKey.currentState!
                                .validate()) {
                              UpdatePasswordRequest request =
                                  UpdatePasswordRequest(
                                currentPassword: currentPasswordController.text,
                                newPassword: passwordController.text,
                                newPasswordConfirmation:
                                    passwordConfirmationController.text,
                              );

                              context
                                  .read<UpdatePasswordCubit>()
                                  .updatePassword(request);
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
                      GoRouter.of(context).pop();
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
                            "back-to-profile".tr(),
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
    );
  }
}
