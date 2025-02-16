import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';

import '../../data/repositories/projects_repo_impl.dart';

class DownLoadCvUseCase {
  final downloadCvUseCase = SirteefyRepositoryImpl();
  Future<Either<Failure,Success>> downloadCv() async {
    return await downloadCvUseCase.downloadCV();
  }
}
