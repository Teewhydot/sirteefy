part of 'projects_bloc.dart';

@immutable
sealed class ProjectsEvent {}

class GetProjectsEvent extends ProjectsEvent {
}
