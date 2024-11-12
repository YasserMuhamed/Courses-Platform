import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({super.key, required this.phoneController});

  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return AppTextField(
      validator: AppValidators.phoneValidator,
      controller: phoneController,
      label: Text("phone".tr()),
    );
  }
}
