part of 'timesheet_bloc.dart';

@immutable
sealed class TimesheetState {}

final class TimesheetInitialState extends TimesheetState {}

final class TimesheetLoadingState extends TimesheetState {}

final class TimesheetLoadedState extends TimesheetState {
  final TimeSheet timeSheet;

  TimesheetLoadedState(this.timeSheet);
}

final class TimesheetErrorState extends TimesheetState {
  final String message;

  TimesheetErrorState(this.message);
}

// final class UsersLoadingState extends TimesheetState {}
//
// final class UsersLoadedState extends TimesheetState {
//   final List<User> users;
//
//   UsersLoadedState(this.users);
// }
//
// final class UsersErrorState extends TimesheetState {
//   final String message;
//
//   UsersErrorState(this.message);
// }
//
// final class ProjectsLoadingState extends TimesheetState {}
//
// final class ProjectsLoadedState extends TimesheetState {
//   final List<Project> projects;
//
//   ProjectsLoadedState(this.projects);
// }
//
// final class ProjectsErrorState extends TimesheetState {
//   final String message;
//
//   ProjectsErrorState(this.message);
// }
