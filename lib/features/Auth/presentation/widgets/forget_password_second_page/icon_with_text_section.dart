import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/core/helpers/app_regex.dart';
import 'package:courses_platform/features/Auth/presentation/widgets/svg_icon.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWithTextSection2 extends StatelessWidget {
  const IconWithTextSection2({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const Center(
            child: SvgIcon(
              path: Assets.assetsSVGsMailOpen,
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text(
              'password-reset'.tr(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'we-sent-code'.tr(),
                style: Theme.of(context).textTheme.labelSmall,
                children: <TextSpan>[
                  TextSpan(
                    text: AppRegex.obfuscateEmail(email),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
