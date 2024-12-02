import 'package:courses_platform/features/Home/data/models/course_lecture/item.dart';
import 'package:courses_platform/features/Home/presentation/widgets/video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LectureItem extends StatelessWidget {
  const LectureItem({super.key, required this.file});
  final Item file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: const [
            Center(
              child: VideoPlayerView(
                url:
                    "http://45.65.114.115/uploads/lectures_items/omar_1733174112_674e2360e34b9.mp4v",
                dataSourceType: DataSourceType.network,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
