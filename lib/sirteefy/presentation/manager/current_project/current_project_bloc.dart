import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'current_project_event.dart';
part 'current_project_state.dart';

class CurrentProjectBloc extends Bloc<CurrentProjectEvent, CurrentProjectState> {
  CurrentProjectBloc() : super(CurrentProjectInitial()) {
    on<FetchCurrentProject>((event, emit)async {
      emit(CurrentProjectLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(CurrentProjectLoaded('Portfolio Website'));
    });
  }
}
