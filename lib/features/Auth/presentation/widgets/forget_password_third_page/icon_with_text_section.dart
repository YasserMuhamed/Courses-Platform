import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithTextSection3 extends StatelessWidget {
  const IconWithTextSection3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 75.h),
        const Center(
          child: SvgIcon(path: Assets.assetsSVGsKeyboardSvgrepoCom),
        ),
        SizedBox(height: 20.h),
        Center(
          child: Text(
            'set-new-password'.tr(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: 10.h),
        Center(
          child: Text(
            "must-be-8-chars".tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: AppColors.darkGrey),
          ),
        ),
      ],
    );
  }
}
