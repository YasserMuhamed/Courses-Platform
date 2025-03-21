import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kForgetPasswordFirstPage);
      },
      child: Text(
        "forgot-password".tr(),
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColors.primaryColor,
              fontSize: 15.sp,
            ),
      ),
    );
  }
}
