import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/shared_pref_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignoutSection extends StatelessWidget {
  const SignoutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: AppColors.errorColor,
      contentPadding: EdgeInsets.zero,
      onTap: () {
        showAdaptiveDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("sign-out".tr()),
                content: Text("are-you-sure-you-want-to-sign-out".tr()),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "no".tr(),
                      style: const TextStyle(color: AppColors.textColor),
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: MyButton(
                      color: AppColors.errorColor,
                      onTap: () async {
                        SharedPrefHelper.clearAllSecuredData();
                        hasToken = false;
                        isAuthorized = false;
                        isVerified = false;

                        GoRouter.of(context)
                            .pushReplacement(AppRoutes.kLoginPage);
                      },
                      text: "yes".tr(),
                    ),
                  ),
                ],
              );
            });
      },
      title: Text("sign-out".tr(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: AppColors.errorColor,
              )),
      trailing: Icon(Icons.logout, color: AppColors.errorColor),
    );
  }
}
