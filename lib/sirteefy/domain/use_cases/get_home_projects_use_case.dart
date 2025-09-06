import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';

import '../entities/project_entity.dart';
import '../failures/failures.dart';
import '../repositories/project/projects_repo.dart';

class GetHomeProjectsUseCase {
  final repo = GetIt.instance<ProjectsRepo>();

  Future<Either<Failure, List<ProjectEntity>>> call() async {
    return await repo.getHomeProjectsFromDataSource();
  }
}