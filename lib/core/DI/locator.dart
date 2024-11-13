import 'package:courses_platform/core/api/api_manager.dart';
import 'package:courses_platform/core/api/dio_factory.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:courses_platform/features/Auth/manager/cubit/cubit/forget_password_otp_cubit.dart';
import 'package:courses_platform/features/Auth/manager/cubit/forget_password_cubit.dart';
import 'package:courses_platform/features/Auth/manager/cubit/login_cubit.dart';
import 'package:courses_platform/features/Auth/manager/cubit/register_cubit.dart';
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
  getIt.registerLazySingleton<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(getIt<AuthRepoImpl>()));
  getIt.registerLazySingleton<ForgetPasswordOtpCubit>(
      () => ForgetPasswordOtpCubit(getIt<AuthRepoImpl>()));
}
