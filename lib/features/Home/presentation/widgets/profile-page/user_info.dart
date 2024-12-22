import 'package:courses_platform/features/Home/presentation/widgets/profile-page/profile_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// ignore: library_prefixes
import 'dart:ui' as UI;

UI.TextDirection direction = UI.TextDirection.ltr;

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.email,
    required this.phone,
    required this.name,
  });
  final String email;
  final String phone;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileImage(),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            text: "${"welcome".tr()}, ",
            style: Theme.of(context).textTheme.labelMedium,
            children: [
              TextSpan(
                text: name,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 60.w,
              child: Text(
                "${"mail".tr()}:",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              width: 250.w,
              child: Text(
                email,
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: context.locale.languageCode == "ar"
                    ? TextAlign.start
                    : TextAlign.end,
                textDirection: direction,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${"phone".tr()}:",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(phone, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
      ],
    );
  }
}
