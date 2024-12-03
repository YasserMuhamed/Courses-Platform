import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/features/Home/data/models/sub_courses/sub_courses.dart';
import 'package:courses_platform/features/Home/presentation/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeCardsBuilder extends StatelessWidget {
  const HomeCardsBuilder({
    super.key,
    required this.subCourses,
  });
  final SubCourses subCourses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemCount: subCourses.data!.data!.length,
        itemBuilder: (context, index) => GestureDetector(
              onTap: () => GoRouter.of(context).push(
                  AppRoutes.kCourseDetailsPage,
                  extra: subCourses.data!.data![index].course!.id),
              child: CustomCard(
                  imageURL: subCourses.data!.data![index].course!.image!,
                  courseName: subCourses.data!.data![index].course!.title!,
                  courseDescription:
                      subCourses.data!.data![index].course!.description!),
            ));
  }
}
