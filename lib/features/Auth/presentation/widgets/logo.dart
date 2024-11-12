import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.cast_for_education_rounded,
      size: 120.sp,
      color: AppColors.secondaryColor,
    );
  }
}
