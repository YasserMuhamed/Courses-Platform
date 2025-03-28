import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/service-locator/locator.dart';
import 'package:courses_platform/features/Auth/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_first_cubit/forget_password_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_second_cubit/forget_password_otp_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/forget_password_third_cubit/forget_password_reset_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:courses_platform/features/Auth/data/models/email_and_otp_model.dart';
import 'package:courses_platform/features/Auth/presentation/manager/verify_user_email_cubit/verify_user_email_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/manager/verify_user_otp_cubit/verify_user_otp_cubit.dart';
import 'package:courses_platform/features/Auth/presentation/pages/forget_password_first_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/forget_password_second_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/forget_password_third_page.dart';
import 'package:courses_platform/features/Home/data/models/course_lecture/item.dart';
import 'package:courses_platform/features/Home/data/repositories/home_repo_impl.dart';
import 'package:courses_platform/features/Home/presentation/manager/course_lecture/course_lecture_cubit.dart';
import 'package:courses_platform/features/Home/presentation/manager/download/download_cubit.dart';
import 'package:courses_platform/features/Home/presentation/manager/home/home_cubit.dart';
import 'package:courses_platform/features/Home/presentation/manager/profile/profile_cubit.dart';
import 'package:courses_platform/features/Home/presentation/manager/update_password/update_password_cubit.dart';
import 'package:courses_platform/features/Home/presentation/pages/course_details_page.dart';
import 'package:courses_platform/features/Home/presentation/pages/home_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/login_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/register_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/verify_user_first_page.dart';
import 'package:courses_platform/features/Auth/presentation/pages/verify_user_second_page.dart';
import 'package:courses_platform/features/Home/presentation/pages/profile_page.dart';
import 'package:courses_platform/features/Home/presentation/pages/update_password.dart';
import 'package:courses_platform/features/Home/presentation/widgets/course-details-page/lecture_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: hasToken
        ? (isAuthorized && isVerified)
            ? AppRoutes.kHomePage
            : AppRoutes.kLoginPage
        : AppRoutes.kLoginPage,
    routes: [
      // *************************** Auth Routes ***************************
      GoRoute(
        path: AppRoutes.kLoginPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<LoginCubit>(),
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kRegisterPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kForgetPasswordFirstPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordCubit>(),
          child: const ForgetPasswordFirstPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kForgetPasswordSecondPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordOtpCubit>(),
          child: ForgetPasswordSecondPage(
            email: state.extra as String,
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.kForgetPasswordThirdPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ForgetPasswordResetCubit>(),
          child: ForgetPasswordThirdPage(
            request: state.extra as EmailAndOtpModel,
          ),
        ),
      ),

      GoRoute(
        path: AppRoutes.kVerifyFirstPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<VerifyUserEmailCubit>(),
          child: const VerifyUserFirstPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.kVerifySecondPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<VerifyUserOtpCubit>(),
          child: VerifyUserSecondPage(
            email: state.extra as String,
          ),
        ),
      ),
      // *************************** Home Routes ***************************
      GoRoute(
        path: AppRoutes.kHomePage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: const HomePage(),
        ),
      ),

      GoRoute(
        path: AppRoutes.kCourseDetailsPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<CourseLectureCubit>(),
          child: CourseDetailsPage(id: state.extra as int),
        ),
      ),

      GoRoute(
        path: AppRoutes.kLectureItem,
        builder: (context, state) => BlocProvider(
          create: (context) => DownloadCubit(getIt<HomeRepoImpl>()),
          child: LectureItem(
            item: state.extra as Item,
          ),
        ),
      ),
      // *************************** Profile Routes ***************************
      GoRoute(
        path: AppRoutes.kProfilePage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
          child: const ProfilePage(),
        ),
      ),

      GoRoute(
        path: AppRoutes.kUpdatePasswordPage,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<UpdatePasswordCubit>(),
          child: const UpdatePasswordPage(),
        ),
      )
    ],
  );
}
