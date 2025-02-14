import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';

import '../../data/repositories/projects_repo_impl.dart';

class SendMessageUseCase {
  final sendMessageRepo  = SirteefyRepositoryImpl();
  Future<Either<Failure,Success>> sendMessage(String email,fullName,message) async {
    return await sendMessageRepo.sendMessageToServer(email, fullName, message);
  }
}
