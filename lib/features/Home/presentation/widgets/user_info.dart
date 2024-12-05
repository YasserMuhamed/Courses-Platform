import 'package:courses_platform/features/Home/presentation/widgets/image_and_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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
        const ImageSection(),
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
        )),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "email".tr(),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            Text(email, style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "phone".tr(),
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
