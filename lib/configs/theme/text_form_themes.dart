import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormThemes {
  TextFormThemes._();
  static double radius = 4.r;

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

  // static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
  //   fillColor: const Color.fromARGB(255, 71, 71, 71),
  //   filled: true,
  //   suffixIconColor: AppColors.lightGrey,
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(radius),
  //   ),
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(radius),
  //     borderSide: BorderSide(color: AppColors.primaryColor, width: 1.w),
  //   ),
  // );
}
