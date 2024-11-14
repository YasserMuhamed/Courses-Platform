import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:courses_platform/features/Auth/data/models/forget_password_second_request.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordThirdPage extends StatefulWidget {
  const ForgetPasswordThirdPage({
    super.key,
    required this.request,
  });
  final ForgetPasswordSecondRequest request;
  @override
  State<ForgetPasswordThirdPage> createState() =>
      _ForgetPasswordThirdPageState();
}

class _ForgetPasswordThirdPageState extends State<ForgetPasswordThirdPage> {
  GlobalKey<FormState> confirmNewPasswordFormKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                  child: SvgIcon(path: "assets/SVGs/keyboard-svgrepo-com.svg"),
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
                  validator: (value) => AppValidators.passwordValidator(value),
                  controller: passwordController,
                  hintText: "enter-email".tr(),
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
                  validator: (value) => AppValidators.confirmPasswordValidator(
                      value, passwordController.text),
                  controller: passwordConfirmationController,
                  hintText: "enter-email".tr(),
                ),
                SizedBox(height: 30.h),
                MyButton(text: "reset-password".tr(), onTap: () {})
              ],
            ),
          ),
        ),
      ),
    )));
  }
}
