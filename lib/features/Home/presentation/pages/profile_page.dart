import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/my_button.dart';
import 'package:courses_platform/core/helpers/shared_pref_helper.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/profile/profile_cubit.dart';
import 'package:courses_platform/features/Home/presentation/widgets/language_section.dart';
import 'package:courses_platform/features/Home/presentation/widgets/user_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile".tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Skeletonizer(
                      child: UserInfo(
                        email: "yasser.muhamed0001@gmail.com",
                        name: "Yasser Mohamed",
                        phone: "01222222222",
                      ),
                    );
                  } else if (state is ProfileSuccess) {
                    return UserInfo(
                      email: state.currentUser.user!.email!,
                      name: state.currentUser.user!.name!,
                      phone: state.currentUser.user!.phone!,
                    );
                  } else if (state is ProfileFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  return UserInfo(
                    email: "email".tr(),
                    name: "name".tr(),
                    phone: "phone".tr(),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 5),
              const LanguageSection(),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 5),
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () {
                  GoRouter.of(context).push(AppRoutes.kUpdatePasswordPage);
                },
                title: Text("reset-password".tr(),
                    style: Theme.of(context).textTheme.labelLarge),
                trailing: const Icon(Icons.lock, color: AppColors.textColor),
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 5),
              const SignoutSection(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

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
