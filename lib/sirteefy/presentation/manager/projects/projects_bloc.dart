import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirteefy/sirteefy/domain/entities/project_entity.dart';
import 'package:sirteefy/sirteefy/domain/use_cases/get_projects_use_case.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(ProjectsInitial()) {
    final GetProjectsUseCase getProjectsUseCase = GetProjectsUseCase();
    on<GetProjectsEvent>((event, emit)async {
      emit(ProjectsLoading());
     await getProjectsUseCase.getProjects().then((projects) {
        projects.fold((failure) {
          emit(ProjectsError(message: failure.message));
        }, (projects) {
          emit(ProjectsLoaded(projects: projects));
        });
      });
    });
  }
}
