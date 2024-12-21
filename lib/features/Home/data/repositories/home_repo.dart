import 'package:courses_platform/core/error/failures.dart';
import 'package:courses_platform/features/Home/data/models/course_lecture/course_lecture.dart';
import 'package:courses_platform/features/Home/data/models/sub_courses/sub_courses.dart';
import 'package:courses_platform/features/Home/data/models/update_password_request.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, SubCourses>> getSubCourses();

  Future<Either<Failures, CourseLecture>> getCourseLectures(int id);

  Future<Either<Failures, String>> updatePassword(
      UpdatePasswordRequest request);


}
