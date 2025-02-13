import 'package:dartz/dartz.dart';

import '../../data/repositories/projects_repo_impl.dart';
import '../failures/failures.dart';

class CurrentProjectUseCase{
  final projectRepo = ProjectRepoImplementation();
Future<Either<Failure, String>> getCurrentProject() async {
    return const Right('Portfolio Website');
  }
}
