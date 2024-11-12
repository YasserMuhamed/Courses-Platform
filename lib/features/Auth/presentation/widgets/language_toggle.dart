import 'package:courses_platform/configs/localization/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () {
        LocalizationService().toggleLocale(context);
      },
      icon: Icon(
        Icons.language,
        size: 24.sp,
      ),
    );
  }
}
