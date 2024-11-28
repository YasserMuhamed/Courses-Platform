import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_platform/configs/localization/localization_service.dart';
import 'package:courses_platform/configs/router/routes.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/features/Home/presentation/manager/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  @override
  void initState() {
    context.read<HomeCubit>().getSubCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text("courses".tr(),
            style: Theme.of(context).textTheme.titleLarge!.copyWith()),
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
              onPressed: () {
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
              return Center(
                child: Text(state.message),
              );
            } else if (state is HomeSuccess) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.subCourses.data!.data!.length,
                  itemBuilder: (context, index) => CustomCard(
                      imageURL:
                          state.subCourses.data!.data![index].course!.image!,
                      courseName:
                          state.subCourses.data!.data![index].course!.title!,
                      courseDescription: state
                          .subCourses.data!.data![index].course!.description!));
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  const CustomCard(
      {super.key,
      required this.imageURL,
      required this.courseName,
      required this.courseDescription});
  final String imageURL;
  final String courseName;
  final String courseDescription;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: AppColors.cardBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.imageURL,
                    height: 200.h,
                    width: double.infinity,
                    errorWidget: (context, url, error) => SizedBox(
                      width: 100.w,
                      child: SvgPicture.asset(
                        "assets/SVGs/not_found.svg",
                        fit: BoxFit.fill,
                        width: 100.w,
                      ),
                    ),
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.courseName,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Text(
                      widget.courseDescription.length > 100
                          ? isExpanded
                              ? widget.courseDescription
                              : '${widget.courseDescription.substring(0, 100)}...'
                          : widget.courseDescription,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.darkGrey,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
