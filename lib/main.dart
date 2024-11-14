import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/observer/bloc_observer.dart';
import 'package:courses_platform/core/DI/locator.dart';
import 'package:courses_platform/courses.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait<void>(
      [checkIfUserLoggedIn(), EasyLocalization.ensureInitialized()]);
  // await SharedPrefHelper.clearAllSecuredData();
  getItSetup();
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
    return isLoggedIn = true;
  } else {
    return isLoggedIn = false;
  }
}
