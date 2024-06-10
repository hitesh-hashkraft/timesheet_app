import 'package:get_it/get_it.dart';
import 'package:timesheet_app/features/home/data/data_sources/timesheet_data_source.dart';
import 'package:timesheet_app/features/home/data/repositories/timesheet_repository_impl.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_multiprojects.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_projects.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_timesheet.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_types.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_users.dart';
import 'package:timesheet_app/features/home/domain/use_cases/get_vehicles.dart';
import 'package:timesheet_app/features/home/presentation/bloc/timesheet_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initTimeSheet();
}

void _initTimeSheet() {
  serviceLocator
    ..registerFactory<TimeSheetDataSource>(
      () => TimeSheetDataSourceImpl(),
    )
    ..registerFactory<TimeSheetRepository>(
      () => TimeSheetRepositoryImpl(
        serviceLocator(),
      ),
    )
    // ..registerFactory(
    //   () => GetTimeSheet(
    //     serviceLocator(),
    //   ),
    // )
    ..registerFactory(
      () => GetUsers(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetProjects(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetTypes(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetVehicles(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetMultiProjects(
        serviceLocator(),
      ),
    )
    ..registerLazySingleton(
      () => TimesheetBloc(
       // getTimeSheet: serviceLocator(),
        getUsers: serviceLocator(),
        getProjects: serviceLocator(),
        getTypes: serviceLocator(),
        getVehicles: serviceLocator(),
        getMultiProjects: serviceLocator(),
      ),
    );
}
