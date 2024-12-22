import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/features/Home/data/models/course_lecture/course_lecture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CourseLectureListBuilder extends StatelessWidget {
  final CourseLecture courseLecture;
  final Set<int> expandedIndices;
  final Function(int, bool) onExpansionChanged;

  const CourseLectureListBuilder({
    super.key,
    required this.courseLecture,
    required this.expandedIndices,
    required this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: ListView.builder(
        itemCount: courseLecture.data!.length,
        itemBuilder: (context, index) => Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: AppColors.lightCardBackground,
                collapsedBackgroundColor: AppColors.lightCardBackground,
                trailing: Container(
                  decoration: BoxDecoration(
                    color: AppColors.altTextColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    expandedIndices.contains(index)
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    color: AppColors.darkerGrey,
                  ),
                ),
                onExpansionChanged: (expanded) {
                  onExpansionChanged(index, expanded);
                },
                title: Text(
                  courseLecture.data![index].title!,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                subtitle: Text(
                  "${courseLecture.data![index].itemsCount!} Lectures",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: AppColors.altTextColor.withAlpha(150),
                        fontWeight: FontWeight.w200,
                      ),
                ),
                children: courseLecture.data![index].items!
                    .asMap()
                    .map(
                      (itemIndex, item) => MapEntry(
                        itemIndex,
                        Column(
                          children: [
                            ListTile(
                              trailing: item.fileType == "pdf"
                                  ? GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).push(
                                            AppRoutes.kLectureItem,
                                            extra: item);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        width: 60.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.altTextColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.assetsSVGsBookOpen,
                                          // color:
                                          //     AppColors.backgroundColor,
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () {
                                        GoRouter.of(context).push(
                                            AppRoutes.kLectureItem,
                                            extra: item);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(6),
                                        width: 60.w,
                                        height: 30.h,
                                        decoration: BoxDecoration(
                                          color: AppColors.altTextColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: SvgPicture.asset(
                                          Assets.assetsSVGsTvPlay,
                                          // color:
                                          //     AppColors.backgroundColor,
                                        ),
                                      ),
                                    ),
                              tileColor: AppColors.cardBackground,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 4.h),
                              title: Text(
                                item.title ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: AppColors.altTextColor,
                                    ),
                              ),
                              subtitle: Row(
                                children: [
                                  item.fileType == 'video'
                                      ? Icon(
                                          FontAwesomeIcons.circlePlay,
                                          color: AppColors.altTextColor
                                              .withAlpha(150),
                                          size: 16.sp,
                                        )
                                      : Icon(
                                          FontAwesomeIcons.filePdf,
                                          color: AppColors.altTextColor
                                              .withAlpha(150),
                                          size: 16.sp,
                                        ),
                                  const SizedBox(width: 5),
                                  Text(
                                    !item.fileSize!.isNotEmpty
                                        ? ''
                                        : "${item.fileSize} ${'mb'.tr()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: AppColors.altTextColor
                                              .withAlpha(150),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            if (itemIndex !=
                                courseLecture.data![index].items!.length - 1)
                              Container(
                                width: double.infinity,
                                height: 1,
                                color: AppColors.lightCardBackground,
                              ),
                          ],
                        ),
                      ),
                    )
                    .values
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
