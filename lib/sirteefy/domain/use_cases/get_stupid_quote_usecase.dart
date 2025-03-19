import 'package:dartz/dartz.dart';
import 'package:sirteefy/sirteefy/data/remote/models/stupid_quote_model.dart';
import 'package:sirteefy/sirteefy/domain/failures/failures.dart';

import '../../data/repositories/projects_repo_impl.dart';

class GetStupidQuoteUseCase {
final _stupidQuoteRepository = SirteefyRepositoryImpl();
  Future<Either<Failure, QuoteModel>> getQuote()async{
    return await _stupidQuoteRepository.getStupidQuote();
  }
}
