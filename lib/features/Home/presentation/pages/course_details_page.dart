import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/features/Home/presentation/manager/course_lecture/course_lecture_cubit.dart';
import 'package:courses_platform/features/Home/presentation/widgets/loading/lectures_list_builder_loading.dart';
import 'package:courses_platform/features/Home/presentation/widgets/course-details-page/lectures_list_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({super.key, required this.id});
  final int id;

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
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
        appBar: _courseDetailsAppBar(context),
        body: BlocBuilder<CourseLectureCubit, CourseLectureState>(
          builder: (context, state) {
            if (state is CourseLectureLoading) {
              return const LectureListBuilderLoading();
            } else if (state is CourseLectureSuccess) {
              return CourseLectureListBuilder(
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

  AppBar _courseDetailsAppBar(BuildContext context) {
    return AppBar(
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
    );
  }
}
