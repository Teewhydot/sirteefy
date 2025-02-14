import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/data/remote/models/social_media_links.dart';

import 'package:sirteefy/sirteefy/domain/failures/failures.dart';

import '../../data/repositories/projects_repo_impl.dart';

class SocialMediaLinksUseCase {
  final socialMediaLinksRepository = SirteefyRepositoryImpl();
  Future<Either<Failure, SocialMediaLinks>> getSocialMediaLinks() async {
    return await socialMediaLinksRepository.getSocialMediaLinks();
  }
}
