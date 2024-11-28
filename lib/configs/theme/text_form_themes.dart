import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormThemes {
  TextFormThemes._();
  static double radius = 10.r;

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    fillColor: Colors.white,
    filled: true,
    suffixIconColor: Colors.grey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: Colors.grey, width: 1.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: Colors.grey, width: 1.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    // fillColor: const Color.fromARGB(255, 23, 23, 23),
    // filled: true,
    suffixIconColor: AppColors.lightGrey,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: AppColors.darkerGrey, width: 1.w),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: AppColors.darkerGrey, width: 1.w),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
    ),
  );
}
