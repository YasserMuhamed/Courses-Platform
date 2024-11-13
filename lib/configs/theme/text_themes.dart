import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemes {
  TextThemes._();

  static TextTheme lightTextTheme = TextTheme(
    // headline
    headlineLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
    headlineMedium: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),

    // title
    titleLarge: TextStyle(fontSize: 18.sp),
    titleMedium: TextStyle(fontSize: 16.sp),
    titleSmall: TextStyle(fontSize: 14.sp),

    // label
    // label
    labelLarge: TextStyle(fontSize: 18.sp),
    labelMedium: TextStyle(fontSize: 16.sp),
    labelSmall: TextStyle(fontSize: 14.sp),
  );

  static TextTheme darkTextTheme = TextTheme(
      // headline
      headlineLarge: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w600),

      // title
      titleLarge: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),

      // label
      labelLarge: TextStyle(fontSize: 18.sp),
      labelMedium: TextStyle(fontSize: 16.sp),
      labelSmall: TextStyle(fontSize: 14.sp));
}
