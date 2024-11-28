import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/observer/bloc_observer.dart';
import 'package:courses_platform/core/service-locator/locator.dart';
import 'package:courses_platform/courses.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'core/helpers/shared_pref_helper.dart';

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
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ar'),
        startLocale: const Locale('ar'),
        saveLocale: true,
        child: const CoursesApp()),
  );
}

checkIfUserLoggedIn() async {
  String? userToken = await SharedPrefHelper.getSecuredString("userToken");
  if (userToken!.isNotEmpty) {
    return hasToken = true;
  } else {
    return hasToken = false;
  }
}

checkIfUserAuthorizedAndVerified() async {
  AuthRepoImpl authRepo = getIt<AuthRepoImpl>();
  String? userToken = await SharedPrefHelper.getSecuredString("userToken");
  if (userToken != null && userToken.isNotEmpty) {
    var response = await authRepo.getCurrentUser();
    response.fold(
      (l) {
        isAuthorized = false;
        isVerified = false;
        Logger().e("Error getting current user: $l");
      },
      (r) {
        isVerified = r.user?.emailVerifiedAt != null;
        isAuthorized = r.message == "Authorized";
      },
    );
  } else {
    Logger().w("User is not logged in");
    isAuthorized = false;
    isVerified = false;
  }
}
