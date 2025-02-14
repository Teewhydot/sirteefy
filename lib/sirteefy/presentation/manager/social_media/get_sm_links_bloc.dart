import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirteefy/sirteefy/data/remote/models/social_media_links.dart';
import 'package:sirteefy/sirteefy/domain/use_cases/social_media_links_usecase.dart';

part 'get_sm_links_event.dart';
part 'get_sm_links_state.dart';

class GetSmLinksBloc extends Bloc<GetSmLinksEvent, GetSmLinksState> {
  GetSmLinksBloc() : super(GetSmLinksInitial()) {
    final SocialMediaLinksUseCase socialMediaLinksUseCase = SocialMediaLinksUseCase();
    on<GetSmLinks>((event, emit) async{
      emit(GetSmLinksLoading());
    final result = await socialMediaLinksUseCase.getSocialMediaLinks();
    result.fold(
      (failure) => emit(GetSmLinksError(failure.message)),
      (socialLinks) => emit(GetSmLinksLoaded(socialLinks)),
    );
    });
  }
}
