part of 'download_cv_bloc.dart';

@immutable
sealed class DownloadCvState {}

final class DownloadCvInitial extends DownloadCvState {}

final class DownloadCvInProgress extends DownloadCvState {
  final double percentage;

  DownloadCvInProgress({required this.percentage});
}

final class DownloadCvSuccess extends DownloadCvState {}

final class DownloadCvFailure extends DownloadCvState {
  final String failureMessage;

  DownloadCvFailure({required this.failureMessage});
}
