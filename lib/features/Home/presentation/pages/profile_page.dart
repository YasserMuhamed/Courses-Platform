import 'package:courses_platform/features/Home/presentation/manager/profile/profile_cubit.dart';
import 'package:courses_platform/features/Home/presentation/widgets/profile-page/language_section.dart';
import 'package:courses_platform/features/Home/presentation/widgets/loading/profile_loading_widget.dart';
import 'package:courses_platform/features/Home/presentation/widgets/profile-page/reset_password_tile.dart';
import 'package:courses_platform/features/Home/presentation/widgets/profile-page/sign_out_section.dart';
import 'package:courses_platform/features/Home/presentation/widgets/profile-page/user_info.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const ProfileLoadingWidget();
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
              const ResetPasswordTile(),
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
