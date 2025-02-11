import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirteefy/sirteefy/domain/entities/project_entity.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  ProjectsBloc() : super(ProjectsInitial()) {
    on<GetProjectsEvent>((event, emit)async {
      emit(ProjectsLoading());
      //delay for 2 seconds then emit error
     await Future.delayed(const Duration(seconds: 5), () {
        emit(ProjectsError(message: 'Failed to load projects'));
      });
    });
  }
}
