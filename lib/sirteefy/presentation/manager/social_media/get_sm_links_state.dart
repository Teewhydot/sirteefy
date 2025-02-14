part of 'get_sm_links_bloc.dart';

@immutable
sealed class GetSmLinksState {}

final class GetSmLinksInitial extends GetSmLinksState {}

final class GetSmLinksLoading extends GetSmLinksState {}

final class GetSmLinksLoaded extends GetSmLinksState {
  final SocialMediaLinks socialMediaLinks;

  GetSmLinksLoaded(this.socialMediaLinks);
}

final class GetSmLinksError extends GetSmLinksState {
  final String message;

  GetSmLinksError(this.message);
}
