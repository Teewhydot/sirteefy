part of 'get_stupid_quote_bloc.dart';

@immutable
sealed class GetStupidQuoteState {}

final class GetStupidQuoteInitial extends GetStupidQuoteState {}

final class GetStupidQuoteLoading extends GetStupidQuoteState {}

final class GetStupidQuoteLoaded extends GetStupidQuoteState {
  final QuoteModel stupidQuote;

  GetStupidQuoteLoaded({required this.stupidQuote});
}

final class GetStupidQuoteError extends GetStupidQuoteState {
  final String message;

  GetStupidQuoteError({required this.message});
}
