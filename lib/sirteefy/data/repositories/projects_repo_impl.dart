
import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/data/remote/models/skill_model.dart';
import 'package:sirteefy/sirteefy/data/remote/models/social_media_links.dart';
import 'package:sirteefy/sirteefy/domain/entities/project_entity.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';
import 'package:sirteefy/sirteefy/domain/repositories/project/projects_repo.dart';
import 'package:sirteefy/utils/functions/handle_exceptions.dart';

import '../remote/data_sources/current_project_data_source.dart';
import '../remote/data_sources/projects_data_source.dart';
import '../remote/data_sources/send_message_data_source.dart';
import '../remote/data_sources/skills_data_source.dart';
import '../remote/data_sources/social_media_links_data_source.dart';

class SirteefyRepositoryImpl implements ProjectsRepo {
  final getProjectsFirebaseImpl = ProjectsFireBaseDataSource();
  final getCurrentProjectFirebaseImpl = CurrentProjectFireBaseDataSource();
  final getSkillsFirebaseImpl = SkillsFireBaseDataSource();
  final sendMessagesFirebaseImpl = SendMessageFirebaseImplementation();
  final getSocialMediaLinksFirebaseImpl =
  SocialMediaLinksFirebaseImplementation();

  @override
  Future<Either<Failure, String>> getCurrentProject() async {
    return handleExceptions(() async {
      return await getCurrentProjectFirebaseImpl.getCurrentProject();
    });
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>>
  getProjectsFromDataSource() async {
    return handleExceptions(() async {
      return await getProjectsFirebaseImpl.getProjects();
    });
  }

  @override
  Future<Either<Failure, SkillModel>> getSkills() async {
    return handleExceptions(() async {
      return await getSkillsFirebaseImpl.getSkills();
    });
  }

  @override
  Future<Either<Failure, SocialMediaLinks>> getSocialMediaLinks() async {
    return handleExceptions(() async {
      return await getSocialMediaLinksFirebaseImpl.getSocialMediaLinks();
    });
  }

  @override
  Future<Either<Failure, Success>> sendMessageToServer(String email, fullName,
      message) async {
    return handleExceptions(() async {
      return await sendMessagesFirebaseImpl.sendMessage(
          email, fullName, message);
    });
  }
}
