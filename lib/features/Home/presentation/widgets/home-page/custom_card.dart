import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/features/Home/data/models/sub_courses/datum.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    super.key,
    required this.data,
  });
  final Datum data;

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8), bottom: Radius.circular(8)),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: widget.data.course!.image!,
                      height: 200.h,
                      width: double.infinity,
                      errorWidget: (context, url, error) => SizedBox(
                        width: 100.w,
                        child: SvgPicture.asset(
                          Assets.assetsSVGsNotFound,
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
                      widget.data.course!.title!,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "${"lectures-count".tr()}: 10",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lightGrey,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Text(
                        widget.data.course!.description!.length > 100
                            ? isExpanded
                                ? widget.data.course!.description!
                                : '${widget.data.course!.description!.substring(0, 100)}...'
                            : widget.data.course!.description!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: AppColors.grey,
                              fontWeight: FontWeight.w200,
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
      ),
    );
  }
}
