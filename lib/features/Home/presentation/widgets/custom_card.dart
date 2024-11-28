import 'package:cached_network_image/cached_network_image.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
