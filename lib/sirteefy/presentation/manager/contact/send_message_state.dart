part of 'send_message_bloc.dart';

@immutable
sealed class SendMessageState {}

final class SendMessageInitial extends SendMessageState {}

final class SendMessageLoading extends SendMessageState {}

final class SendMessageLoaded extends SendMessageState {
}

final class SendMessageError extends SendMessageState {
  final String message;

  SendMessageError({required this.message});
}
