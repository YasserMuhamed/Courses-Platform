import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/course_lecture_cubit.dart';
import 'package:courses_platform/features/Home/presentation/widgets/loading/expansion_loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.id});
  final int id;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  Set<int> expandedIndices = {};

  @override
  void initState() {
    super.initState();
    context.read<CourseLectureCubit>().getCourseLectures(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.altTextColor,
              size: 26,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'course-lectures'.tr(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<CourseLectureCubit, CourseLectureState>(
          builder: (context, state) {
            if (state is CourseLectureLoading) {
              return Skeletonizer(
                child: ExpansionLoading(),
              );
            } else if (state is CourseLectureSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: ListView.builder(
                  itemCount: state.courseLecture.data!.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 6.h, horizontal: 4.w),
                        child: ExpansionTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.lightCardBackground,
                          collapsedBackgroundColor:
                              AppColors.lightCardBackground,
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
                            setState(() {
                              if (expanded) {
                                expandedIndices.add(index);
                              } else {
                                expandedIndices.remove(index);
                              }
                            });
                          },
                          title: Text(
                            state.courseLecture.data![index].title!,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          subtitle: Text(
                            "${state.courseLecture.data![index].itemsCount!} Lectures",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: AppColors.altTextColor.withAlpha(150),
                                  fontWeight: FontWeight.w200,
                                ),
                          ),
                          children: state.courseLecture.data![index].items!
                              .asMap()
                              .map(
                                (itemIndex, item) => MapEntry(
                                  itemIndex,
                                  Column(
                                    children: [
                                      ListTile(
                                        trailing: MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          height: 30.h,
                                          color: AppColors.textColor
                                              .withOpacity(1),
                                          onPressed: () {
                                            GoRouter.of(context).push(
                                                AppRoutes.kLectureItem,
                                                extra: item);
                                          },
                                          child: Text(
                                            'show'.tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .copyWith(
                                                  color:
                                                      AppColors.cardBackground,
                                                  fontWeight: FontWeight.bold,
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
                                                    Icons
                                                        .play_circle_fill_rounded,
                                                    color: AppColors
                                                        .altTextColor
                                                        .withAlpha(150),
                                                    size: 16.sp,
                                                  )
                                                : Icon(
                                                    Icons.file_copy_rounded,
                                                    color: AppColors
                                                        .altTextColor
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
                                                    color: AppColors
                                                        .altTextColor
                                                        .withAlpha(150),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (itemIndex !=
                                          state.courseLecture.data![index]
                                                  .items!.length -
                                              1)
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
            } else if (state is CourseLectureFailure) {
              return Center(
                child: Text("error".tr()),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
