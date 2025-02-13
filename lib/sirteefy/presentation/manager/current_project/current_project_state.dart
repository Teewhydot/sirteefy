part of 'current_project_bloc.dart';

@immutable
sealed class CurrentProjectState {}

final class CurrentProjectInitial extends CurrentProjectState {}

final class CurrentProjectLoading extends CurrentProjectState {}

final class CurrentProjectLoaded extends CurrentProjectState {
  final String currentProject;

  CurrentProjectLoaded({required this.currentProject});
}

final class CurrentProjectError extends CurrentProjectState {
  final String message;

  CurrentProjectError({required this.message});
}
