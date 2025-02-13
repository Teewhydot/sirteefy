import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sirteefy/sirteefy/data/remote/models/skill_model.dart';
import 'package:sirteefy/sirteefy/domain/use_cases/get_skill_usecase.dart';

part 'skills_event.dart';
part 'skills_state.dart';

class SkillsBloc extends Bloc<SkillsEvent, SkillsState> {
  SkillsBloc() : super(SkillsInitial()) {
    final GetSkillsUseCase getSkillsUseCase = GetSkillsUseCase();
    on<GetSkills>((event, emit) async {
      emit(SkillsLoading());
      final failureOrSkills = await getSkillsUseCase.getSkills();
      failureOrSkills.fold((failure) {
        emit(SkillsError(message: failure.message));
      }, (skills) {
        emit(SkillsLoaded(skills: skills));
      });
    });
  }
}
