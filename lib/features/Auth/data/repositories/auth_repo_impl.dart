import 'package:courses_platform/core/api/api_manager.dart';
import 'package:courses_platform/core/error/failures.dart';
import 'package:courses_platform/features/Auth/data/models/login_request.dart';
import 'package:courses_platform/features/Auth/data/models/login_response/login_response.dart';
import 'package:courses_platform/features/Auth/data/models/register_request.dart';
import 'package:courses_platform/features/Auth/data/models/register_response/register_response.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.apiManager});

  final ApiManager apiManager;

  @override
  Future<Either<Failures, LoginResponse>> loginUsers(
      LoginRequest loginRequest) async {
    try {
      Response response = await apiManager.post(
          endPoint: "/login", data: loginRequest.toJson());

      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      return Right(loginResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, RegisterResponse>> registerUsers(
      RegisterRequest registerRequest) async {
    try {
      Response response = await apiManager.post(
          endPoint: "/register", data: registerRequest.toJson());

      RegisterResponse registerResponse =
          RegisterResponse.fromJson(response.data);
      return Right(registerResponse);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> forgetPasswordSendEmail(String email) async {
    try {
      Response response = await apiManager
          .post(endPoint: "/password/reset-code", data: {"email": email});

      return Right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> forgetPasswordSendOTP(
      String email, String code) async {
    try {
      Response response = await apiManager.post(
          endPoint: "/password/code-valid",
          data: {"email": email, "code": code});
      Logger().i("${response.data}  ResponseForgetPasswordOTP from Repo");

      return Right(response.data['status']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      Logger().i("Error From ResponseForgetPasswordOTP from Repo");
      return Left(ServerFailure(error: e.toString()));
    }
  }
}
