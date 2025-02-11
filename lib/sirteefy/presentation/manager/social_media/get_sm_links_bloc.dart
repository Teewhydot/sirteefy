import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'get_sm_links_event.dart';
part 'get_sm_links_state.dart';

class GetSmLinksBloc extends Bloc<GetSmLinksEvent, GetSmLinksState> {
  GetSmLinksBloc() : super(GetSmLinksInitial()) {
    on<GetSmLinks>((event, emit) async{
      emit(GetSmLinksLoading());
      await Future.delayed(const Duration(seconds: 10));
      emit(GetSmLinksLoaded(const [
        'https://www.facebook.com/sirteefy',
        'https://www.instagram.com/sirteefy',
        'https://www.twitter.com/sirteefy',
        'https://www.linkedin.com/in/sirteefy',
      ]));
    });
  }
}
