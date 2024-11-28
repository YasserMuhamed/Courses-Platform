import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/course_lecture_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key, required this.id});
  final int id;

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
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
              size: 20.sp,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            "course-details".tr(),
            style: const TextStyle(
              color: AppColors.altTextColor,
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: BlocBuilder<CourseLectureCubit, CourseLectureState>(
          builder: (context, state) {
            if (state is CourseLectureLoading) {
              return const Center(
                child: CircularProgressIndicator(),
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
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: AppColors.primaryColor,
                          trailing: Container(
                            decoration: BoxDecoration(
                              color: AppColors.altTextColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: AppColors.primaryColor,
                                )),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                          title: Text(state.courseLecture.data![index].title!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  )),
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
