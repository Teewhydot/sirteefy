import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_stupid_quote_event.dart';
part 'get_stupid_quote_state.dart';

class GetStupidQuoteBloc extends Bloc<GetStupidQuoteEvent, GetStupidQuoteState> {
  GetStupidQuoteBloc() : super(GetStupidQuoteInitial()) {
    on<GetStupidQuote>((event, emit) async{
      emit(GetStupidQuoteLoading());
      await Future.delayed(const Duration(seconds: 8));
      emit(GetStupidQuoteLoaded(stupidQuote: {'teewhydot': 'Life is a spoon'}));
    });
  }
}
