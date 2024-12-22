import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomSlider extends StatelessWidget {
  const BottomSlider({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: Center(
        child: SmoothPageIndicator(
            effect: ExpandingDotsEffect(
              dotColor: AppColors.grey,
              activeDotColor: AppColors.primaryColor,
              dotHeight: 10.h,
              dotWidth: 10.w,
              spacing: 4.w,
            ),
            controller: pageController,
            count: 3),
      ),
    );
  }
}
