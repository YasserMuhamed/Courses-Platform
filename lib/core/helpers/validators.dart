import 'package:courses_platform/core/helpers/app_regex.dart';
import 'package:easy_localization/easy_localization.dart';

class AppValidators {
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return "required".tr();
    } else if (!AppRegex.isEmailValid(value)) {
      return "invalid-email".tr();
    }
    return null;
  }

  static String? nameValidator(String? value) {
    if (value!.isEmpty) {
      return "required".tr();
    } else if (AppRegex.hasSpecialCharacter(value)) {
      return "name-should-not-contain-special-chars".tr();
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return "required".tr();
    } else if (value.length < 8) {
      return "password-length".tr();
    }
    return null;
  }

  static String? confirmPasswordValidator(String? value, String password) {
    if (value!.isEmpty) {
      return "required".tr();
    } else if (value != password) {
      return "password-mismatch".tr();
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    if (value!.isEmpty) {
      return "required".tr();
    } else if (!AppRegex.isPhoneNumberValid(value)) {
      return "invalid-phone".tr();
    }
    return null;
  }

  static String? otpValidator(String? value) {
    if (value!.isEmpty) {
      return "";
    }
    return null;
  }
}
