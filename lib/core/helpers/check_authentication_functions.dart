import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/shared_pref_helper.dart';
import 'package:courses_platform/core/service-locator/locator.dart';
import 'package:courses_platform/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:logger/logger.dart';

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
