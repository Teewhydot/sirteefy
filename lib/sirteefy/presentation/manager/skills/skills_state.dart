part of 'skills_bloc.dart';

@immutable
sealed class SkillsState {}

final class SkillsInitial extends SkillsState {}

final class SkillsLoading extends SkillsState {}

final class SkillsLoaded extends SkillsState {
  final SkillModel skills;

  SkillsLoaded({required this.skills});
}

final class SkillsError extends SkillsState {
  final String message;

  SkillsError({required this.message});
}
