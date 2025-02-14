import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/failures/failures.dart';
import '../../../domain/use_cases/send_message_usecase.dart';

part 'send_message_event.dart';
part 'send_message_state.dart';

class SendMessageBloc extends Bloc<SendMessageEvent, SendMessageState> {
  SendMessageBloc() : super(SendMessageInitial()) {
    final sendMessageUseCase = SendMessageUseCase();
    on<SendMessageRequested>((event, emit) async{
      emit(SendMessageLoading());
      final result = await sendMessageUseCase.sendMessage(event.email, event.name, event.message);
      result.fold((failure) {
        emit(SendMessageError(message: failure.message));
        emit(SendMessageInitial());
      }, (success) {
        emit(SendMessageLoaded());
        emit(SendMessageInitial());
      });
    });
  }
}
