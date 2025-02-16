import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirteefy/sirteefy/domain/use_cases/current_project_usecase.dart';

part 'current_project_event.dart';
part 'current_project_state.dart';

class CurrentProjectBloc extends Bloc<CurrentProjectEvent, CurrentProjectState> {
  final CurrentProjectUseCase currentProjectUseCase = CurrentProjectUseCase();
  CurrentProjectBloc() : super(CurrentProjectInitial()) {
    on<FetchCurrentProject>((event, emit)async {
      emit(CurrentProjectLoading());
      final failureOrCurrentProject = await currentProjectUseCase.getCurrentProject();
      failureOrCurrentProject.fold((failure) {
        emit(CurrentProjectError(message: failure.failureMessage));
      }, (currentProject) {
        emit(CurrentProjectLoaded(currentProject: currentProject));
      });
    });
  }
}
