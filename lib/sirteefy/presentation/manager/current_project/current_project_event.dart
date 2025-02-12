part of 'current_project_bloc.dart';

@immutable
sealed class CurrentProjectEvent {}

class FetchCurrentProject extends CurrentProjectEvent {
}
