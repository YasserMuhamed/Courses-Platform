import 'package:courses_platform/features/Home/presentation/widgets/profile-page/user_info.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      child: UserInfo(
        email: "yasser.muhamed0001@gmail.com",
        name: "Yasser Mohamed",
        phone: "01222222222",
      ),
    );
  }
}
