import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';


class DownLoadCvUseCase {
  Future<Either<Failure,Success>> downloadCv() async {
    for (int i = 0; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return Right(DownloadSuccess());
  }
}
