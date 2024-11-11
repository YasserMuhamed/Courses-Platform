import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplaySnackBar {
  static void successSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message,
          style: GoogleFonts.cairo(fontSize: 16.sp, color: Colors.white)),
      backgroundColor: Colors.green,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void errorSnackBar(String message, BuildContext context) {
    final snackBar = SnackBar(
      content: Text(message,
          style: GoogleFonts.cairo(fontSize: 16.sp, color: Colors.white)),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.horizontal,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
