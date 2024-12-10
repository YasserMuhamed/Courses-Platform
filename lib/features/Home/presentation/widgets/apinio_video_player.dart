import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

class ApinioVideoPlayer extends StatefulWidget {
  const ApinioVideoPlayer({super.key, required this.url});
  final String url;

  @override
  State<ApinioVideoPlayer> createState() => _ApinioVideoPlayerState();
}

class _ApinioVideoPlayerState extends State<ApinioVideoPlayer> {
  late CachedVideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  @override
  void initState() {
    super.initState();

    _videoPlayerController = CachedVideoPlayerController.network(
      widget.url,
    )..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.ltr,
                child: CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
