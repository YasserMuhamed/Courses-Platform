import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/courses.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/helpers/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  String currentLocale = await SharedPrefHelper.getString("locale");
  print("$currentLocale    currentLocale in main.dart");

  await checkIfUserLoggedIn();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('en'),
        startLocale: const Locale('en'),
        saveLocale: true,
        child: const CoursesApp()),
  );
}

checkIfUserLoggedIn() async {
  String? userToken = await SharedPrefHelper.getString("userToken");
  if (userToken!.isNotEmpty) {
    return isLoggedIn = true;
  } else {
    return isLoggedIn = false;
  }
}
