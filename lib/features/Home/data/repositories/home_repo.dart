import 'package:courses_platform/core/error/failures.dart';
import 'package:courses_platform/features/Home/data/models/sub_courses/sub_courses.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, SubCourses>> getSubCourses();
  
}
