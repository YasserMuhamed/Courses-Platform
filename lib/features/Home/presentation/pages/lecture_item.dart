import 'package:courses_platform/features/Home/data/models/course_lecture/item.dart';
import 'package:courses_platform/features/Home/presentation/pages/pdf_page.dart';
import 'package:courses_platform/features/Home/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
              : VideoPlayerView(
                  url: item.file!, dataSourceType: DataSourceType.network),
        ),
      ),
    );
  }
}
