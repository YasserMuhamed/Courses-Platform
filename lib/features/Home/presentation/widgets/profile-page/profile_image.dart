import 'package:courses_platform/core/constants/assets.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(Assets.assetsImagesProfile),
    );
  }
}
