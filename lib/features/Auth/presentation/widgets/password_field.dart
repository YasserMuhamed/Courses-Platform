import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final bool obscureText;
  final VoidCallback toggleObscureText;

  const PasswordField({
    super.key,
    required this.passwordController,
    required this.obscureText,
    required this.toggleObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: "enter-password".tr(),
      validator: AppValidators.passwordValidator,
      controller: passwordController,
      label: Text("password".tr()),
      obscureText: obscureText,
      suffixIcon: IconButton(
        onPressed: toggleObscureText,
        icon: obscureText
            ? Icon(
                Icons.visibility_off_outlined,
                size: 20.sp,
              )
            : Icon(
                Icons.visibility_outlined,
                size: 20.sp,
              ),
      ),
      maxLines: 1,
    );
  }
}
