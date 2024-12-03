import 'package:courses_platform/configs/localization/localization_service.dart';
import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/login_constants.dart';
import 'package:courses_platform/core/helpers/shared_pref_helper.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/home_cubit.dart';
import 'package:courses_platform/features/Home/presentation/widgets/home-page/home_card_builder.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> Function() onRefresh() {
    return () async {
      context.read<HomeCubit>().getSubCourses();
    };
  }

  @override
  void initState() {
    context.read<HomeCubit>().getSubCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text("courses".tr(),
            style: Theme.of(context).textTheme.titleMedium!),
        actions: [
          IconButton(
            onPressed: () {
              LocalizationService().toggleLocale(context);
            },
            icon: Icon(
              Icons.language,
              color: AppColors.textColor,
              size: 19.sp,
            ),
          ),
          IconButton(
              onPressed: () async {
                SharedPrefHelper.clearAllSecuredData();
                hasToken = false;
                isAuthorized = false;
                isVerified = false;

                GoRouter.of(context).pushReplacement(AppRoutes.kLoginPage);
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.textColor,
                size: 19.sp,
              )),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomeFailure) {
              return ListView(
                children: [
                  Center(
                    child: Text(state.message),
                  ),
                ],
              );
            } else if (state is HomeSuccess) {
              return state.subCourses.data!.data!.isEmpty
                  ? Center(
                      child: Text(
                        "no-course-found".tr(),
                        style: Theme.of(context).textTheme.titleMedium!,
                      ),
                    )
                  : HomeCardsBuilder(
                      subCourses: state.subCourses,
                    );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
