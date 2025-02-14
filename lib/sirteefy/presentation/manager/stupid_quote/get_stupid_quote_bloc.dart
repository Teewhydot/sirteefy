import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirteefy/sirteefy/data/remote/models/stupid_quote_model.dart';

import '../../../domain/use_cases/get_stupid_quote_usecase.dart';

part 'get_stupid_quote_event.dart';
part 'get_stupid_quote_state.dart';

class GetStupidQuoteBloc extends Bloc<GetStupidQuoteEvent, GetStupidQuoteState> {
  GetStupidQuoteBloc() : super(GetStupidQuoteInitial()) {
    final getStupidQuoteUseCase = GetStupidQuoteUseCase();
    on<GetStupidQuote>((event, emit) async{
      emit(GetStupidQuoteLoading());
      final result = await getStupidQuoteUseCase.getQuote();
      result.fold((failure) {
        emit(GetStupidQuoteError(message: failure.failureMessage));
      }, (quote) {
        emit(GetStupidQuoteLoaded(stupidQuote: quote));
      });
    });
  }
}
