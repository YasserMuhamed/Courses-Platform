// import 'package:appinio_video_player/appinio_video_player.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class ApinioVideoPlayer extends StatefulWidget {
//   const ApinioVideoPlayer({super.key, required this.url});
//   final String url;

//   @override
//   State<ApinioVideoPlayer> createState() => _ApinioVideoPlayerState();
// }

// class _ApinioVideoPlayerState extends State<ApinioVideoPlayer> {
//   late CachedVideoPlayerController videoPlayerController;
//   late CustomVideoPlayerController _customVideoPlayerController;

//   String videoUrl =
//       "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

//   @override
//   void initState() {
//     super.initState();
//     videoPlayerController = CachedVideoPlayerController.network(widget.url)
//       ..initialize().then((value) => setState(() {}));
//     _customVideoPlayerController = CustomVideoPlayerController(
//       context: context,
//       videoPlayerController: videoPlayerController,
//     );
//   }

//   @override
//   void dispose() {
//     _customVideoPlayerController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text(widget.url),
//       ),
//       child: SafeArea(
//         child: CustomVideoPlayer(
//             customVideoPlayerController: _customVideoPlayerController),
//       ),
//     );
//   }
// }
