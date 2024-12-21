import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:courses_platform/core/error/failures.dart';
import 'package:courses_platform/features/Home/data/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';

part 'download_state.dart';

class DownloadCubit extends Cubit<DownloadState> {
  DownloadCubit(this.homeRepo) : super(DownloadCubitInitial());
  final HomeRepo homeRepo;
  // StreamSubscription<double>? _progressSubscription;

  Future<Either<Failures, String>> downloadVideo(
      String url, String fileName) async {
    double progress = 0;
    emit(DownloadCubitLoading(progress));
    try {
      // Get app directory for secure storage
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/$fileName';

      // Download the video
      Dio dio = Dio();
      await dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            progress = (received / total);
            print('Progress: $progress%');
            emit(DownloadCubitLoading(progress));
          }
        },
      );

      print('File downloaded to $filePath');
      emit(DownloadCubitSuccess());
      return right(filePath);
    } catch (e) {
      print('Error downloading file: $e');
      emit(DownloadCubitFailure());
      return left(ServerFailure(error: e.toString()));
    }
  }
}
