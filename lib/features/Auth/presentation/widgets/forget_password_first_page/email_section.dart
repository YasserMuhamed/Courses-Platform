import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailSection extends StatelessWidget {
  const EmailSection({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "email".tr(),
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10.h),
        AppTextField(
          validator: AppValidators.emailValidator,
          controller: emailController,
          hintText: "enter-email".tr(),
          label: Text('email'.tr()),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ],
    );
  }
}
