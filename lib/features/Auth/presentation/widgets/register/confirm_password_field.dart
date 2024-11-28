import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ConfirmPasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool obscureText;
  final VoidCallback toggleObscureText;

  const ConfirmPasswordField({
    super.key,
    required this.passwordController,
    required this.obscureText,
    required this.toggleObscureText,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      validator: (value) => AppValidators.confirmPasswordValidator(
          value, passwordController.text),
      controller: confirmPasswordController,
      label: Text("confirm-password".tr()),
      hintText: "enter-confirm-password".tr(),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      obscureText: obscureText,
      suffixIcon: IconButton(
        onPressed: toggleObscureText,
        icon: obscureText
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
    );
  }
}
