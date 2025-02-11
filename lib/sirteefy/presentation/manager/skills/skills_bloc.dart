import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc() : super(SkillsInitial()) {
    on<GetSkills>((event, emit) async {
      emit(SkillsLoading());
      await Future.delayed(const Duration(seconds: 20), () {
        emit(SkillsError(message: 'Failed to load skills'));
      });
    });
  }
}
