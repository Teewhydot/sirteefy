import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/data/remote/models/skill_model.dart';

import '../../data/repositories/projects_repo_impl.dart';
import '../failures/failures.dart';

class GetSkillsUseCase {
  final skillsRepo = SirteefyRepositoryImpl();
  Future<Either<Failure, SkillModel>> getSkills() async {
    return await skillsRepo.getSkills();
  }
}
