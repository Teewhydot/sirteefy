part of 'current_project_bloc.dart';

@immutable
sealed class CurrentProjectState {}

final class CurrentProjectInitial extends CurrentProjectState {}

final class CurrentProjectLoading extends CurrentProjectState {}

final class CurrentProjectLoaded extends CurrentProjectState {
  final String project;

  CurrentProjectLoaded(this.project);
}

final class CurrentProjectError extends CurrentProjectState {
  final String message;

  CurrentProjectError(this.message);
}
