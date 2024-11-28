import 'package:courses_platform/core/helpers/app_text_field.dart';
import 'package:courses_platform/core/helpers/validators.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NameField extends StatelessWidget {
  const NameField({super.key, required this.nameController});
  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      validator: AppValidators.nameValidator,
      controller: nameController,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      label: Text("name".tr()),
      hintText: "enter-name".tr(),
    );
  }
}
