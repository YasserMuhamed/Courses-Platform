import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoCoursesHomeWidget extends StatelessWidget {
  const NoCoursesHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(
        parent: BouncingScrollPhysics(),
      ),
      children: [
        SizedBox(
          height: 285.h,
        ),
        Center(
          child: Text(
            "no-course-found".tr(),
            style: Theme.of(context).textTheme.titleMedium!,
          ),
        ),
      ],
    );
  }
}
