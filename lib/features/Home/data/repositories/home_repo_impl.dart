import 'dart:async';
import 'package:courses_platform/core/api/api_manager.dart';
import 'package:courses_platform/core/error/failures.dart';
import 'package:courses_platform/features/Home/data/models/course_lecture/course_lecture.dart';
import 'package:courses_platform/features/Home/data/models/sub_courses/sub_courses.dart';
import 'package:courses_platform/features/Home/data/models/update_password_request.dart';
import 'package:courses_platform/features/Home/data/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiManager apiManager;
  HomeRepoImpl({required this.apiManager});

  @override
  Future<Either<Failures, SubCourses>> getSubCourses() async {
    try {
      final response = await apiManager.get(endPoint: '/subscribed-courses');
      final subCourses = SubCourses.fromJson(response.data);
      return Right(subCourses);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CourseLecture>> getCourseLectures(int id) async {
    try {
      final response = await apiManager.get(endPoint: '/courses/$id/lectures');
      final courseLecture = CourseLecture.fromJson(response.data);
      return Right(courseLecture);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> updatePassword(
      UpdatePasswordRequest request) async {
    try {
      apiManager.patch(endPoint: "/update/password", data: request.toJson());
      return Right("Password Updated Successfully".tr());
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
