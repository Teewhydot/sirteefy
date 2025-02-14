import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/data/remote/models/skill_model.dart';
import 'package:sirteefy/sirteefy/domain/entities/project_entity.dart';
import 'package:sirteefy/sirteefy/domain/exceptions/custom_exceptions.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';
import 'package:sirteefy/sirteefy/domain/repositories/project/projects_repo.dart';

import '../remote/data_sources/current_project_data_source.dart';
import '../remote/data_sources/projects_data_source.dart';
import '../remote/data_sources/send_message_data_source.dart';
import '../remote/data_sources/skills_data_source.dart';

class ProjectRepoImplementation implements ProjectsRepo {
  final getProjectsFirebaseImpl = ProjectsFireBaseDataSource();
  final getCurrentProjectFirebaseImpl = CurrentProjectFireBaseDataSource();
  final getSkillsFirebaseImpl = SkillsFireBaseDataSource();
  final sendMessagesFirebaseImpl = SendMessageFirebaseImplementation();

  @override
  Future<Either<Failure, String>> getCurrentProject() async {
    try {
      final result = await getCurrentProjectFirebaseImpl.getCurrentProject();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure(message: 'Server Failure'));

    }  on TimeoutException catch (_) {
      return Left(TimeoutFailure(message: 'Request Timed Out'));
    }

    on SocketException catch (e) {
      return Left(NoInternetFailure(message: 'No Internet ${e.toString()}'));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>>
      getProjectsFromDataSource() async {
    try {
      final result = await getProjectsFirebaseImpl.getProjects();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure(message: 'Server Failure'));
    }  on TimeoutException catch (_) {
      return Left(TimeoutFailure(message: 'Request Timed Out'));
    }

    on SocketException catch (_) {
      return Left(NoInternetFailure(message: 'No Internet'));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SkillModel>> getSkills() async {
    try {
      final result = await getSkillsFirebaseImpl.getSkills();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure(message: 'Server Failure'));
    } on TimeoutException catch (_) {
      return Left(TimeoutFailure(message: 'Request Timed Out'));
    }

    on SocketException catch (_) {
      return Left(NoInternetFailure(message: 'No Internet'));
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getSocialMediaLinks() {
    // TODO: implement getSocialMediaLinks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Success>> sendMessageToServer(String email,fullName,message) async {
    try {
      final result = await sendMessagesFirebaseImpl.sendMessage(
          email, fullName, message);
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure(message: 'Server Failure'));
    } on TimeoutException catch (_) {
      return Left(TimeoutFailure(message: 'Request Timed Out'));
    }
    on SocketException catch (_) {
      return Left(NoInternetFailure(message: 'No Internet'));
    } catch (e) {
      return Left(UnknownFailure(message: "Unknown Error: ${e.toString()}"));
    }
  }
}
