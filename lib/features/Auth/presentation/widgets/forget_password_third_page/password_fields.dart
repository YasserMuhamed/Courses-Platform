import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordFields extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmationController;
  final bool isObscure;
  final Function toggleObscure;

  const PasswordFields({
    super.key,
    required this.passwordController,
    required this.passwordConfirmationController,
    required this.isObscure,
    required this.toggleObscure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          hintText: "new-password".tr(),
          obscureText: isObscure,
          suffixIcon: IconButton(
            onPressed: () => toggleObscure(),
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
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(
            "password".tr(),
          ),
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
          hintText: "new-password-confirm".tr(),
          obscureText: isObscure,
          suffixIcon: IconButton(
            onPressed: () => toggleObscure(),
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
          floatingLabelBehavior: FloatingLabelBehavior.never,
          label: Text(
            "confirm-password".tr(),
          ),
        ),
      ],
    );
  }
}
