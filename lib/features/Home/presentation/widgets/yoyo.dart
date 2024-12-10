// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/material.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late CachedVideoPlayerController _controller;
//   late CustomVideoPlayerController _customVideoPlayerController;

//   String videoUrl =
//       "http://45.65.114.115/uploads/lectures_items/omar_1733281173_674fc59592490.mp4";

//   @override
//   void initState() {
//     super.initState();
//     _controller = CachedVideoPlayerController.network(videoUrl)
//       ..initialize().then((value) => setState(() {}));
//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: _controller,
//     );
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: CustomVideoPlayer(
//             customVideoPlayerController: _customVideoPlayerController),
//       ),
//     );
//   }
// }
