// import 'package:flutter/material.dart';
// import 'package:universal_video_controls/universal_video_controls.dart';
// import 'package:universal_video_controls_video_player/universal_video_controls_video_player.dart';
// import 'package:video_player/video_player.dart';

// class SinglePlayerSingleVideoScreen extends StatefulWidget {
//   const SinglePlayerSingleVideoScreen({super.key});

//   @override
//   State<SinglePlayerSingleVideoScreen> createState() =>
//       _SinglePlayerSingleVideoScreenState();
// }

// class _SinglePlayerSingleVideoScreenState
//     extends State<SinglePlayerSingleVideoScreen> {
//   late VideoPlayerController _controller;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeVideoPlayer(
//         'http://45.65.114.115/uploads/lectures_items/omar_1733281173_674fc59592490.mp4');
//   }

//   void _initializeVideoPlayer(String source) async {
//     _controller = VideoPlayerController.networkUrl(Uri.parse(source));
//     await _controller.initialize();
//     setState(() {
//       _isInitialized = true;
//     });
//     _controller.play();
//     _controller.addListener(() {
//       if (_controller.value.hasError) {
//         debugPrint(_controller.value.errorDescription);
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Player'),
//       ),
//       body: Center(
//         child: _isInitialized
//             ? AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoControls(
//                   player: VideoPlayerControlsWrapper(_controller),
//                 ),
//               )
//             : const CircularProgressIndicator(),
//       ),
//     );
//   }
// }
