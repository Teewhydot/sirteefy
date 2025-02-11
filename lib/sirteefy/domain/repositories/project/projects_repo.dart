import 'package:sirteefy/sirteefy/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../../entities/project_entity.dart';

abstract class ProjectsRepo {
  Future<Either<Failure, List<ProjectEntity>>> getProjectsFromDataSource();
}
