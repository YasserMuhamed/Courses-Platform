import 'package:chewie/chewie.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class CachedVideoWidget extends StatefulWidget {
  final String videoUrl;

  const CachedVideoWidget({super.key, required this.videoUrl});

  @override
  CachedVideoWidgetState createState() => CachedVideoWidgetState();
}

class CachedVideoWidgetState extends State<CachedVideoWidget> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  String? _errorMessage;
  bool _isOffline = false;
  bool _isMuted = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
    _monitorNetwork();
  }

  Future<void> _initializeVideo() async {
    try {
      // Check if the video is already cached
      final cachedFile =
          await DefaultCacheManager().getFileFromCache(widget.videoUrl);
      if (cachedFile != null) {
        _videoPlayerController = VideoPlayerController.file(cachedFile.file);
      } else {
        // Start caching the video and initialize the video player with the URL
        DefaultCacheManager().getSingleFile(widget.videoUrl);
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
      }

      await _videoPlayerController!.initialize();
      setState(() {
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          autoPlay: false,
          looping: false,
          allowFullScreen: true,
          allowMuting: false,
          errorBuilder: (context, errorMessage) {
            return Center(
              child: Text(
                'face-error-video-try-again'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          },
          additionalOptions: (context) => [
            OptionItem(
              onTap: _toggleMute,
              iconData: _isMuted ? Icons.volume_off : Icons.volume_up,
              title: _isMuted ? 'Unmute' : 'Mute',
            ),
          ],
        );
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load video: ${e.toString()}';
      });
    }
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _videoPlayerController!.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  void _monitorNetwork() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      setState(() {
        _isOffline = results.contains(ConnectivityResult.none);
      });
    });
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();

    // Remove the cached file when the widget is disposed
    DefaultCacheManager().removeFile(widget.videoUrl).then((_) {
      debugPrint('Cached video file deleted.');
    });

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isOffline) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off, color: Colors.red, size: 50),
            SizedBox(height: 10),
            Text(
              'No internet connection. Please check your network.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        ),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 50),
            const SizedBox(height: 10),
            Text(
              "face-error-video-try-again".tr(),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        ),
      );
    }

    return _chewieController != null
        ? Chewie(controller: _chewieController!)
        : const Center(child: CircularProgressIndicator());
  }
}
