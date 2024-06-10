import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timesheet_app/core/error/exception.dart';
import 'package:timesheet_app/core/usecase/usecase.dart';
import 'package:timesheet_app/features/home/domain/entities/project.dart';
import 'package:timesheet_app/features/home/domain/entities/timesheet.dart';
import 'package:timesheet_app/features/home/domain/entities/type.dart';
import 'package:timesheet_app/features/home/domain/entities/user.dart';
import 'package:timesheet_app/features/home/domain/entities/vehicle.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_multiprojects.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_projects.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_timesheet.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_types.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_users.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_vehicles.dart';

import '../../domain/entities/multiproject.dart';

part 'timesheet_event.dart';

part 'timesheet_state.dart';

class TimesheetBloc extends Bloc<TimesheetEvent, TimesheetState> {
  //final GetTimeSheet _getTimeSheet;
  final GetUsers _getUsers;
  final GetProjects _getProjects;
  final GetTypes _getTypes;
  final GetVehicles _getVehicles;
  final GetMultiProjects _getMultiProjects;

  TimesheetBloc({
    //required GetTimeSheet getTimeSheet,
    required GetUsers getUsers,
    required GetProjects getProjects,
    required GetTypes getTypes,
    required GetVehicles getVehicles,
    required GetMultiProjects getMultiProjects,
  })  : //_getTimeSheet = getTimeSheet,
        _getUsers = getUsers,
        _getProjects = getProjects,
        _getTypes = getTypes,
        _getVehicles = getVehicles,
        _getMultiProjects = getMultiProjects,
        super(TimesheetInitialState()) {
    on<TimesheetEvent>((_, emit) => emit(TimesheetLoadingState()));
    on<TimeSheetFetchEvent>(_onTimeSheetFetchEvent);
    // on<UsersFetchEvent>(_onUsersFetchEvent);
    // on<ProjectsFetchEvent>(_onProjectsFetchEvent);
  }

  void _onTimeSheetFetchEvent(
      TimeSheetFetchEvent event,
      Emitter<TimesheetState> emit,
      ) async {
    try {
      final userResponse = await _getUsers(NoParams());
      final projectsResponse = await _getProjects(NoParams());
      final typesResponse = await _getTypes(NoParams());
      final vehiclesResponse = await _getVehicles(NoParams());
      final multiProjectsResponse = await _getMultiProjects(NoParams());

      final List<User> users = userResponse.fold(
            (failure) {
          emit(TimesheetErrorState(failure.message));
          return [];
        },
            (users) => users,
      );

      final List<Project> projects = projectsResponse.fold(
            (failure) {
          emit(TimesheetErrorState(failure.message));
          return [];
        },
            (projects) => projects,
      );

      final List<TypeClass> types = typesResponse.fold(
            (failure) {
          emit(TimesheetErrorState(failure.message));
          return [];
        },
            (types) => types,
      );

      final List<Vehicle> vehicles = vehiclesResponse.fold(
            (failure) {
          emit(TimesheetErrorState(failure.message));
          return [];
        },
            (vehicles) => vehicles,
      );

      final List<MultiProject> multiProjects = multiProjectsResponse.fold(
            (failure) {
          emit(TimesheetErrorState(failure.message));
          return [];
        },
            (multiProjects) => multiProjects,
      );

      final timeSheet = TimeSheet(
        users: users,
        projects: projects,
        type: types,
        vehicles: vehicles,
        multiProjects: multiProjects,
        startKm: null,
        endKm: null,
        note: null,
      );

      emit(TimesheetLoadedState(timeSheet));
    } catch (e) {
      emit(TimesheetErrorState(e.toString()));
    }
  }



// void _onUsersFetchEvent(UsersFetchEvent event, Emitter<TimesheetState> emit) async {
//   final response = await _getUsers(NoParams());
//   response.fold(
//     (failure) => emit(UsersErrorState(failure.message)),
//     (users) => emit(UsersLoadedState(users)),
//   );
// }
//
// void _onProjectsFetchEvent(ProjectsFetchEvent event, Emitter<TimesheetState> emit) async {
//   final response = await _getProjects(NoParams());
//   response.fold(
//     (failure) => emit(ProjectsErrorState(failure.message)),
//     (projects) => emit(ProjectsLoadedState(projects)),
//   );
// }
}
