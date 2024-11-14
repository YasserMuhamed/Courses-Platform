import 'package:courses_platform/core/error/failures.dart';
import 'package:courses_platform/features/Auth/data/models/forget_password_second_request.dart';
import 'package:courses_platform/features/Auth/data/models/login_request.dart';
import 'package:courses_platform/features/Auth/data/models/login_response/login_response.dart';
import 'package:courses_platform/features/Auth/data/models/register_request.dart';
import 'package:courses_platform/features/Auth/data/models/register_response/register_response.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failures, LoginResponse>> loginUsers(LoginRequest loginRequest);
  Future<Either<Failures, RegisterResponse>> registerUsers(
      RegisterRequest registerRequest);
  Future<Either<Failures, String>> forgetPasswordSendEmail(String email);
  Future<Either<Failures, bool>> forgetPasswordSendOTP(
      ForgetPasswordSecondRequest forgetPasswordSecondRequest);
  Future<Either<Failures, String>> passwordReset(
      ForgetPasswordSecondRequest forgetPasswordSecondRequest,
      String newPassword);
}
