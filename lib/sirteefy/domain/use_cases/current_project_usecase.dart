import 'package:dartz/dartz.dart';

import '../../data/repositories/projects_repo_impl.dart';
import '../failures/failures.dart';

class CurrentProjectUseCase {
  final projectRepo = SirteefyRepositoryImpl();
  Future<Either<Failure, String>> getCurrentProject() async {
    return await projectRepo.getCurrentProject();
  }
}
