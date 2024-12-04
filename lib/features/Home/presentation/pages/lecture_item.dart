import 'package:courses_platform/features/Home/data/models/course_lecture/item.dart';
import 'package:courses_platform/features/Home/presentation/widgets/cache_widget.dart';
import 'package:flutter/material.dart';

class LectureItem extends StatelessWidget {
  const LectureItem({super.key, required this.file});
  final Item file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CachedVideoWidget(videoUrl: file.file!),
        ),
      ),
    );
  }
}
