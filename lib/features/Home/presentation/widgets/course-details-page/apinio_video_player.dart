import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:courses_platform/core/constants/assets.dart';
import 'package:courses_platform/features/Home/presentation/manager/download/download_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ApinioVideoPlayer extends StatefulWidget {
  const ApinioVideoPlayer(
      {super.key,
      required this.url,
      required this.fileName,
      required this.dataSourceType});
  final String url;
  final String fileName;
  final DataSourceType dataSourceType;

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
    
    switch (widget.dataSourceType) {
      case DataSourceType.network:
        _videoPlayerController = CachedVideoPlayerController.network(
          widget.url,
        )..initialize().then((value) => setState(() {}));
        break;
      case DataSourceType.file:
        _videoPlayerController = CachedVideoPlayerController.file(
          File(widget.fileName),
        )..initialize().then((value) => setState(() {}));
        break;
      case DataSourceType.asset:
        _videoPlayerController = CachedVideoPlayerController.asset(
          widget.url,
        )..initialize().then((value) => setState(() {}));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController = CachedVideoPlayerController.network(
          widget.url,
        )..initialize().then((value) => setState(() {}));
        break;
    }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _videoPlayerController.value.isInitialized
                  ? CustomVideoPlayer(
                      customVideoPlayerController: _customVideoPlayerController,
                    )
                  : Skeletonizer(
                      child: Container(
                        height: 200.h,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
              SizedBox(height: 8.h),
              Text(
                widget.fileName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              BlocBuilder<DownloadCubit, DownloadState>(
                builder: (context, state) {
                  if (state is DownloadCubitLoading) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(6),
                          width: 48.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            color: AppColors.altTextColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            Assets.assetsSVGsDownload,
                            // color: AppColors
                            //     .backgroundColor,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        CircularProgressIndicator(
                          value: state.progress,
                        ),
                        const SizedBox(height: 20),
                        Text('${(state.progress * 100).toStringAsFixed(0)}%'),
                      ],
                    );
                  } else if (state is DownloadCubitSuccess) {
                    return Container(
                      padding: EdgeInsets.all(6),
                      width: 48.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.altTextColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        FontAwesomeIcons.check,
                        color: AppColors.secondaryColor,
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      context
                          .read<DownloadCubit>()
                          .downloadVideo(widget.url, widget.fileName);
                    },
                    child: Container(
                      padding: EdgeInsets.all(6),
                      width: 48.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.altTextColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SvgPicture.asset(
                        Assets.assetsSVGsDownload,
                        // color: AppColors
                        //     .backgroundColor,
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
