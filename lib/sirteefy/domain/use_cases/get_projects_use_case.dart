import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/domain/entities/project_entity.dart';

import '../../data/repositories/projects_repo_impl.dart';
import '../failures/failures.dart';

class GetProjectsUseCase {
  final projectRepo = ProjectRepoImplementation();
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    return await projectRepo.getProjectsFromDataSource();
  }
}
