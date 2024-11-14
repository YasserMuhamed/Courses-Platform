import 'package:courses_platform/core/api/api_manager.dart';
import 'package:courses_platform/core/api/dio_factory.dart';
import 'package:courses_platform/features/Auth/data/manager/Login_cubit/login_cubit.dart';
import 'package:courses_platform/features/Auth/data/manager/forget_password_first_cubit/forget_password_cubit.dart';
import 'package:courses_platform/features/Auth/data/manager/forget_password_second_cubit/forget_password_otp_cubit.dart';
import 'package:courses_platform/features/Auth/data/manager/register_cubit/register_cubit.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo_impl.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getItSetup() {
  getIt.registerLazySingleton<ApiManager>(
      () => ApiManager(dio: DioFactory.getDio()));

  getIt.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(apiManager: getIt<ApiManager>()));

  getIt.registerLazySingleton<LoginCubit>(
      () => LoginCubit(getIt<AuthRepoImpl>()));

  getIt.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<ForgetPasswordOtpCubit>(
      () => ForgetPasswordOtpCubit(getIt<AuthRepoImpl>()));
}
