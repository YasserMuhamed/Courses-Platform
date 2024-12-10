import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LectureListBuilderLoading extends StatelessWidget {
  const LectureListBuilderLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
            child: ListTile(
              tileColor: AppColors.lightCardBackground,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              trailing: Container(
                width: 25.w,
                height: 24.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.altTextColor.withAlpha(50),
                ),
              ),
              title: Text(
                  "Placeat et quidem aspernatur est facere voluptatibus.",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontWeight: FontWeight.w600)),
              subtitle: Text(
                "Lectures 10",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: AppColors.altTextColor.withAlpha(150),
                      fontWeight: FontWeight.w200,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
