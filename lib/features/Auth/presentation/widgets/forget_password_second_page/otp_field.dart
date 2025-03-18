import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: library_prefixes
import 'dart:ui' as UI;
UI.TextDirection direction = UI.TextDirection.ltr;


class OTPField extends StatelessWidget {
  const OTPField({
    super.key,
    required this.onSubmit,
  });

  final Function(String otp) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: direction,
      child: OtpTextField(
        showCursor: false,
        numberOfFields: 6,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        borderColor: const Color.fromARGB(255, 27, 27, 27),
        focusedBorderColor: AppColors.primaryColor,
        styles: const [],
        fieldWidth: 40.w,
        filled: true,
        fillColor: const Color.fromARGB(255, 34, 34, 34),
        enabledBorderColor: AppColors.backgroundColor,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        showFieldAsBox: true,
        borderWidth: 1.0,
        //runs when a code is typed in
        onSubmit: (value) {
          onSubmit(value);
        },
        //runs when every textfield is filled
      ),
    );
  }
}
