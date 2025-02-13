import 'package:sirteefy/sirteefy/data/remote/models/skill_model.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

import '../../entities/project_entity.dart';

abstract class ProjectsRepo {
  Future<Either<Failure, List<ProjectEntity>>> getProjectsFromDataSource();
  Future<Either<Failure,String>> getCurrentProject();
  Future<Either<Failure,String>> getSocialMediaLinks();
  Future<Either<Failure,SkillModel>> getSkills();
  Future<Either<Failure,Success>> sendMessageToServer();
}
