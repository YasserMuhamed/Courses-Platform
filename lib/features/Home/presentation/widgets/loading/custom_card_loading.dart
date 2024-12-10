import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomCardLoading extends StatefulWidget {
  const CustomCardLoading({
    super.key,
  });

  @override
  State<CustomCardLoading> createState() => _CustomCardLoadingState();
}

class _CustomCardLoadingState extends State<CustomCardLoading> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Skeletonizer(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                color: AppColors.cardBackground,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8),
                                bottom: Radius.circular(8)),
                            child: Container(
                              height: 200.h,
                              width: double.infinity,
                              color: AppColors.darkerGrey,
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
                              "Course Full Name ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              "lectures-count: 10",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightGrey,
                                  ),
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nunc nec ultricies.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: AppColors.grey,
                                    fontWeight: FontWeight.w200,
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
              ),
            ),
          );
        });
  }
}
