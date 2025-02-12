import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  SendMessageBloc() : super(SendMessageInitial()) {
    on<SendMessageRequested>((event, emit) async{
      emit(SendMessageLoading());
      await Future.delayed(const Duration(seconds: 7));
      emit(SendMessageLoaded());
      await Future.delayed(const Duration(seconds: 2));
      emit(SendMessageInitial());
    });
  }
}
