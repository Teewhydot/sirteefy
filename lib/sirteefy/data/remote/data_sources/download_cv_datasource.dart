import 'dart:async';

import 'package:dio/dio.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';

abstract class DownloadCVDataSource {
  Future<Success> downloadCV();
  Stream<Map<String, int>> get downloadProgressStream;
}

class DownloadCVDataSourceImpl implements DownloadCVDataSource {
  final Dio dio = Dio();
  final _progressController = StreamController<Map<String, int>>();

  @override
  Future<Success> downloadCV() async {
    await dio.download(
      'https://www.sirteefy.com/cv.pdf',
      'cv.pdf',
      onReceiveProgress: (received, total) {
        _progressController.add({
          'received': received,
          'total': total,
        });
      },
    );
    return DownloadSuccess();
  }

  @override
  Stream<Map<String, int>> get downloadProgressStream =>
      _progressController.stream;
  void dispose() {
    _progressController.close();
  }
}
