import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      suffixIcon: const Icon(Icons.email_outlined),
      validator: AppValidators.emailValidator,
      controller: emailController,
      label: Text("email".tr()),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hintText: "enter-email".tr(),
    );
  }
}
