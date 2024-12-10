import 'package:courses_platform/features/Home/data/models/course_lecture/item.dart';
import 'package:courses_platform/features/Home/presentation/widgets/apinio_video_player.dart';
import 'package:courses_platform/features/Home/presentation/widgets/pdf_page.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as UI;

UI.TextDirection direction = UI.TextDirection.ltr;

class LectureItem extends StatelessWidget {
  const LectureItem({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: item.fileType == "pdf"
              ? PDFPage(url: item.file!, name: item.title!)
              : ApinioVideoPlayer(url: item.file!),
        ),
      ),
    );
  }
}
