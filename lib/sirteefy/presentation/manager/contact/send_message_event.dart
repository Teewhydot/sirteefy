part of 'send_message_bloc.dart';

@immutable
sealed class SendMessageEvent {}

final class SendMessageRequested extends SendMessageEvent {
  final String name;
  final String email;
  final String message;

  SendMessageRequested({
    required this.name,
    required this.email,
    required this.message,
  });
}

final class SendMessageCompleted extends SendMessageEvent {}
