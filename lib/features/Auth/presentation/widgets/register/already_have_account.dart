import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "already-have-account".tr(),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 15.sp,
                ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "go-to-sign-in".tr(),
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
