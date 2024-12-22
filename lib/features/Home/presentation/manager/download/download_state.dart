part of 'download_cubit.dart';

sealed class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object> get props => [];
}

final class DownloadCubitInitial extends DownloadState {}

final class DownloadCubitLoading extends DownloadState {
  final double progress;

  const DownloadCubitLoading(this.progress);

  @override
  List<Object> get props => [progress];
}

final class DownloadCubitSuccess extends DownloadState {}

final class DownloadCubitFailure extends DownloadState {}
