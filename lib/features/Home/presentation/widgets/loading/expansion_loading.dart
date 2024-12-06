import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ExpansionLoading extends StatelessWidget {
  const ExpansionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) => ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        trailing: Icon(
          Icons.arrow_drop_down,
          color: AppColors.textColor,
        ),
        title: Text(
          "state.courseLecture.data![index].title!",
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        subtitle: Text(
          "state.courseLecture.data![index].itemsCount!Lectures",
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: AppColors.altTextColor.withAlpha(150),
                fontWeight: FontWeight.w200,
              ),
        ),
        children: [
          Column(
            children: [
              ListTile(
                trailing: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  height: 30,
                  color: AppColors.textColor.withOpacity(1),
                  onPressed: () {},
                  child: Text(
                    'show',
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: AppColors.darkPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                tileColor: AppColors.darkPrimaryColor,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                title: Text(
                  "item.title ",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: AppColors.altTextColor,
                      ),
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      Icons.play_circle_fill_rounded,
                      color: AppColors.altTextColor.withAlpha(150),
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "!item.fileSize!.isNotEmpty",
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: AppColors.altTextColor.withAlpha(150),
                          ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.textColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
