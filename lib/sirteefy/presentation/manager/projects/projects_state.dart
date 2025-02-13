part of 'projects_bloc.dart';

@immutable
sealed class ProjectsState {}

final class ProjectsInitial extends ProjectsState {}
final class ProjectsLoading extends ProjectsState {}
final class ProjectsLoaded extends ProjectsState {
  final List<ProjectEntity> projects;
  ProjectsLoaded({required this.projects});
}
final class ProjectsError extends ProjectsState {
  final String message;

  ProjectsError({required this.message});
}
