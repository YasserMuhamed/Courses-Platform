import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.prefixIcon,
      this.hintText,
      this.onChange,
      this.suffixIcon,
      this.obscureText,
      this.validator,
      this.keyType,
      this.label,
      this.controller,
      this.maxLines,
      this.floatingLabelBehavior,
      this.minLines,
      this.focusNode});
  final bool? obscureText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final int? maxLines;
  final FocusNode? focusNode;
  final int? minLines;
  final Widget? label;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputType? keyType;
  final TextEditingController? controller;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines,
      focusNode: focusNode,
      minLines: minLines,
      controller: controller,
      keyboardType: keyType ?? TextInputType.text,
      validator: validator,
      obscureText: obscureText ?? false,
      onChanged: onChange,
      autofocus: true,
      decoration: InputDecoration(
        labelStyle: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppColors.altTextColor),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.error)) {
            return Colors
                .red; // Or any other color you want to use for error state
          } else if (states.contains(WidgetState.focused)) {
            return Theme.of(context).primaryColor;
          } else {
            return Theme.of(context).disabledColor;
          }
        }),
        hintText: hintText,
        alignLabelWithHint: true,
        floatingLabelBehavior:
            floatingLabelBehavior ?? FloatingLabelBehavior.auto,
        label: label ?? const Text(""),
        errorStyle: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: Colors.red, fontSize: 14.sp),
      ),
    );
  }
}
