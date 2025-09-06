import 'package:bloc/bloc.dart';
import 'package:sirteefy/sirteefy/domain/entities/project_entity.dart';
import 'package:sirteefy/sirteefy/domain/use_cases/get_home_projects_use_case.dart';

part 'home_projects_event.dart';
part 'home_projects_state.dart';

class HomeProjectsBloc extends Bloc<HomeProjectsEvent, HomeProjectsState> {
  HomeProjectsBloc() : super(HomeProjectsInitial()) {
    final GetHomeProjectsUseCase getHomeProjectsUseCase = GetHomeProjectsUseCase();
    on<GetHomeProjectsEvent>((event, emit)async {
      emit(HomeProjectsLoading());
     await getHomeProjectsUseCase.call().then((projects) {
        projects.fold((failure) {
          emit(HomeProjectsError(message: failure.failureMessage));
        }, (projects) {
          emit(HomeProjectsLoaded(projects: projects));
        });
      });
    });
  }
}