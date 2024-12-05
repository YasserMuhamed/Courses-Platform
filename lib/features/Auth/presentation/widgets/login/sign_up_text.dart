import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "dont-have-account".tr(),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 15.sp,
                ),
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRoutes.kRegisterPage);
            },
            child: Text(
              "sign-up-new-account".tr(),
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 15.sp,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// dart run flutter_native_splash:create --path=flutter_native_splash.yaml
