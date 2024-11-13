import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;
  final Widget? widget;
  final double? height;
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.color,
    this.widget,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(6.r),
      elevation: 5,
      child: MaterialButton(
        minWidth: double.infinity,
        height: 26.h,
        onPressed: onTap,
        child: widget ??
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.white,
                  ),
            ),
      ),
    );
  }
}
