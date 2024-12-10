// import 'dart:io';

// import 'package:chewie/chewie.dart';
// import 'package:courses_platform/features/Auth/presentation/pages/forget_password_second_page.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:logger/logger.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerView extends StatefulWidget {
//   const VideoPlayerView({
//     super.key,
//     required this.url,
//     required this.dataSourceType,
//     required this.title,
//     required this.createdAt,
//   });

//   final String url;
//   final String title;
//   final String createdAt;

//   final DataSourceType dataSourceType;

//   @override
//   State<VideoPlayerView> createState() => _VideoPlayerViewState();
// }

// class _VideoPlayerViewState extends State<VideoPlayerView> {
//   late VideoPlayerController _videoPlayerController;

//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();

//     switch (widget.dataSourceType) {
//       case DataSourceType.asset:
//         _videoPlayerController = VideoPlayerController.asset(widget.url);
//         break;
//       case DataSourceType.network:
//         {
//           _videoPlayerController =
//               VideoPlayerController.networkUrl(Uri.parse(widget.url));
//           Logger().i("Video URL: ${widget.url}");
//           setState(
//             () => _chewieController = ChewieController(
//               videoPlayerController: _videoPlayerController,
//               aspectRatio: 16 / 9,
//             ),
//           );
//           Logger().i("Video URL: ${widget.url}");
//         }
//         break;
//       case DataSourceType.file:
//         _videoPlayerController = VideoPlayerController.file(File(widget.url));
//         break;
//       case DataSourceType.contentUri:
//         _videoPlayerController =
//             VideoPlayerController.contentUri(Uri.parse(widget.url));
//         break;
//     }

//     // _videoPlayerController.initialize().then(
//     //       (_) => setState(
//     //         () => _chewieController = ChewieController(
//     //           videoPlayerController: _videoPlayerController,
//     //           aspectRatio: 16 / 9,
//     //         ),
//     //       ),
//     //     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Directionality(
//               textDirection: direction,
//               child: AspectRatio(
//                 aspectRatio: 16 / 9,
//                 child: Chewie(controller: _chewieController),
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 widget.title,
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "${"created-at".tr()}: ${widget.createdAt}",
//                 style: Theme.of(context).textTheme.titleSmall,
//               ),
//             ),
//             SizedBox(height: 10),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         child: Icon(
//           Icons.file_download_outlined,
//           size: 26,
//         ),
//       ),
//     );
//   }
// }
