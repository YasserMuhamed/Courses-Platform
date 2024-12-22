import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordTile extends StatelessWidget {
  const ResetPasswordTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        GoRouter.of(context).push(AppRoutes.kUpdatePasswordPage);
      },
      title: Text("reset-password".tr(),
          style: Theme.of(context).textTheme.labelLarge),
      trailing: const Icon(Icons.lock, color: AppColors.textColor),
    );
  }
}
