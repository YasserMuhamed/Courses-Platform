import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/check_authentication_functions.dart';
import 'package:courses_platform/core/observer/bloc_observer.dart';
import 'package:courses_platform/core/service-locator/locator.dart';
import 'package:courses_platform/courses.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItSetup();

  await Future.wait<void>([
    checkIfUserLoggedIn(),
    EasyLocalization.ensureInitialized(),
    checkIfUserAuthorizedAndVerified()
  ]);

  Logger().i("User has token: $hasToken");
  Logger().i("User is authorized: $isAuthorized");
  Logger().i("User is verified: $isVerified");

  Bloc.observer = MyBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: Assets
          .assetsTranslations, // <-- change the path of the translation files
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
      saveLocale: true,
      child: const CoursesApp(),
    ),
  );
}
