part of 'home_projects_bloc.dart';

abstract class HomeProjectsState {}

class HomeProjectsInitial extends HomeProjectsState {}

class HomeProjectsLoading extends HomeProjectsState {}

class HomeProjectsLoaded extends HomeProjectsState {
  final List<ProjectEntity> projects;

  HomeProjectsLoaded({required this.projects});
}

class HomeProjectsError extends HomeProjectsState {
  final String message;

  HomeProjectsError({required this.message});
}