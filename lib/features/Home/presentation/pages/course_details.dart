import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/course_lecture_cubit.dart';
import 'package:courses_platform/features/Home/presentation/widgets/loading/lectures_list_builder_loading.dart';
import 'package:courses_platform/features/Home/presentation/widgets/lectures_list_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              return LectureListBuilderLoading();
            } else if (state is CourseLectureSuccess) {
              return CourseLectureList(
                courseLecture: state.courseLecture,
                expandedIndices: expandedIndices,
                onExpansionChanged: (index, expanded) {
                  setState(() {
                    if (expanded) {
                      expandedIndices.add(index);
                    } else {
                      expandedIndices.remove(index);
                    }
                  });
                },
              );
            } else if (state is CourseLectureFailure) {
              return Center(
                child: Text(state.message),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
