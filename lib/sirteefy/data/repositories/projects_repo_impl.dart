import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/domain/entities/project_entity.dart';
import 'package:sirteefy/sirteefy/domain/exceptions/custom_exceptions.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';
import 'package:sirteefy/sirteefy/domain/repositories/project/projects_repo.dart';

import '../remote/data_sources/current_project_data_source.dart';
import '../remote/data_sources/projects_data_source.dart';

class ProjectRepoImplementation implements ProjectsRepo {
  final getProjectsFirebaseImpl = ProjectsFireBaseDataSource();
 final getCurrentProjectFirebaseImpl = CurrentProjectFireBaseDataSource();


  @override
  Future<Either<Failure, String>> getCurrentProject() async {
   try {
      final result = await getCurrentProjectFirebaseImpl.getCurrentProject();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } on SocketException catch (_) {
      return Left(NoInternetFailure());
   } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>>
      getProjectsFromDataSource() async {
    try {
      final result = await getProjectsFirebaseImpl.getProjects();
      return Right(result);
    } on ServerException catch (_) {
      return Left(ServerFailure());
    } on SocketException catch (_) {
      return Left(NoInternetFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getSkills() {
    // TODO: implement getSkills
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getSocialMediaLinks() {
    // TODO: implement getSocialMediaLinks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> sendMessageToServer() {
    // TODO: implement sendMessageToServer
    throw UnimplementedError();
  }
}
