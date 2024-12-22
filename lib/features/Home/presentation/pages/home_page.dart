import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/features/Home/presentation/manager/home/home_cubit.dart';
import 'package:courses_platform/features/Home/presentation/pages/saved_videos_page.dart';
import 'package:courses_platform/features/Home/presentation/widgets/home-page/home_card_builder.dart';
import 'package:courses_platform/features/Home/presentation/widgets/home-page/no_courses_home_widget.dart';
import 'package:courses_platform/features/Home/presentation/widgets/loading/custom_card_loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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

// TODO : fix showing wrong data after log-out and login with another account
  @override
  void initState() {
    context.read<HomeCubit>().getSubCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _homeAppBar(context),
      body: RefreshIndicator(
        onRefresh: onRefresh(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return CustomCardLoading();
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
                  ? NoCoursesHomeWidget()
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

  AppBar _homeAppBar(BuildContext context) {
    return AppBar(
      elevation: 4,
      title:
          Text("courses".tr(), style: Theme.of(context).textTheme.titleMedium!),
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
              onPressed: () {
                GoRouter.of(context).push(AppRoutes.kProfilePage);
              },
              icon: SvgPicture.asset(
                Assets.assetsSVGsUserRound,
                colorFilter: const ColorFilter.mode(
                    AppColors.textColor, BlendMode.srcIn),
                width: 24,
              )),
        ),
        IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SavedVideosPage()));
            },
            icon: Icon(Icons.download_rounded)),
      ],
    );
  }
}
