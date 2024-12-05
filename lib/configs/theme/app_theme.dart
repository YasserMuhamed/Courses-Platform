import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/configs/theme/text_form_themes.dart';
import 'package:courses_platform/configs/theme/text_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:google_fonts/google_fonts.dart';

ThemeData buildAppTheme(BuildContext context) {
  // final isArabic = context.locale.languageCode == "ar";
  // final fontFamily = isArabic
  //     ? GoogleFonts.cairo().fontFamily
  //     : GoogleFonts.inter().fontFamily;

  return ThemeData(
    fontFamily: "Cairo",
    scaffoldBackgroundColor: AppColors.backgroundColor,
    // primaryColor: ,
    brightness: Brightness.dark,
    textTheme: TextThemes.darkTextTheme,
    colorSchemeSeed: Colors.blue,
    inputDecorationTheme: TextFormThemes.darkInputDecorationTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.altTextColor,
        fontSize: 18.sp,
        fontFamily: "Cairo",
      ),
      iconTheme: IconThemeData(color: AppColors.altTextColor, size: 18.sp),
    ),
  );
}
