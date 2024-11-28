import 'package:courses_platform/core/api/api_manager.dart';
import 'package:courses_platform/core/api/dio_factory.dart';
import 'package:courses_platform/features/Auth/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_first_cubit/forget_password_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_second_cubit/forget_password_otp_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_third_cubit/forget_password_reset_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:courses_platform/features/Auth/presentation/manager/verify_user_email_cubit/verify_user_email_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/verify_user_otp_cubit/verify_user_otp_cubit.dart';
import 'package:courses_platform/features/Home/data/repositories/home_repo_impl.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/home_cubit.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void getItSetup() {
  getIt.registerLazySingleton<ApiManager>(
      () => ApiManager(dio: DioFactory.getDio()));

  getIt.registerLazySingleton<AuthRepoImpl>(
      () => AuthRepoImpl(apiManager: getIt<ApiManager>()));

  getIt.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(apiManager: getIt<ApiManager>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<RegisterCubit>(
      () => RegisterCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<ForgetPasswordOtpCubit>(
      () => ForgetPasswordOtpCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<ForgetPasswordResetCubit>(
      () => ForgetPasswordResetCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<VerifyUserEmailCubit>(
      () => VerifyUserEmailCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<VerifyUserOtpCubit>(
      () => VerifyUserOtpCubit(getIt<AuthRepoImpl>()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepoImpl>()));
}
