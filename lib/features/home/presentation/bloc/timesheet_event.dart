part of 'timesheet_bloc.dart';

@immutable
sealed class TimesheetEvent {}

final class TimeSheetFetchEvent extends TimesheetEvent {}

// final class UsersFetchEvent extends TimesheetEvent {}
//
// final class ProjectsFetchEvent extends TimesheetEvent {}