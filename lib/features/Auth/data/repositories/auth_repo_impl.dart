import 'package:courses_platform/core/api/api_manager.dart';
import 'package:courses_platform/core/error/failures.dart';
import 'package:courses_platform/features/Auth/data/models/current_user/current_user.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/data/models/login_request.dart';
import 'package:courses_platform/features/Auth/data/models/login_response/login_response.dart';
import 'package:courses_platform/features/Auth/data/models/register_request.dart';
import 'package:courses_platform/features/Auth/data/models/register_response/register_response.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
  Future<Either<Failures, bool>> forgetPasswordSendOTP(
      EmailAndOtpModel request) async {
    try {
      Response response = await apiManager.post(
          endPoint: "/password/code-valid",
          data: {"email": request.email, "code": request.code});
      // print(
      //     "${response.data['status']}  ResponseForgetPasswordOTP from Repo 1111111111111111111111111111111111111111111111111111111111111");

      return Right(response.data['status']);
    } catch (e) {
      if (e is DioException) {
        // print(
        //     "Error From ResponseForgetPasswordOTP from Repo Dio Exception 22222222222222222222222222222222222222222222222222222222222222");
        return Left(ServerFailure.fromDioException(e));
      }
      // print("Error From ResponseForgetPasswordOTP from Repo");
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> passwordReset(
      EmailAndOtpModel forgetPasswordSecondRequest, String newPassword) async {
    try {
      Response response =
          await apiManager.post(endPoint: "/password/reset", data: {
        "email": forgetPasswordSecondRequest.email,
        "code": forgetPasswordSecondRequest.code,
        "new_password": newPassword
      });
      return Right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<String, CurrentUser>> getCurrentUser() async {
    try {
      Response response = await apiManager.get(endPoint: "/me");

      CurrentUser currentUser = CurrentUser.fromJson(response.data);
      return Right(currentUser);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<Failures, String>> verifyUserSendEmail(String email) async {
    try {
      Response response = await apiManager
          .post(endPoint: "/email/send-code", data: {"email": email});

      return Right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> verifyUserSendOTP(
      EmailAndOtpModel request) async {
    try {
      Response response = await apiManager.post(
          endPoint: "/email/code-valid",
          data: {"email": request.email, "code": request.code});

      return Right(response.data['message']);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }

      return Left(ServerFailure(error: e.toString()));
    }
  }
}
