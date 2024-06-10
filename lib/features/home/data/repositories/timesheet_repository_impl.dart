import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/exception.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/features/home/data/data_sources/timesheet_data_source.dart';
import 'package:timesheet_app/features/home/domain/entities/multiproject.dart';
import 'package:timesheet_app/features/home/domain/entities/project.dart';
import 'package:timesheet_app/features/home/domain/entities/timesheet.dart';
import 'package:timesheet_app/features/home/domain/entities/type.dart';
import 'package:timesheet_app/features/home/domain/entities/user.dart';
import 'package:timesheet_app/features/home/domain/entities/vehicle.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';

class TimeSheetRepositoryImpl implements TimeSheetRepository {
  final TimeSheetDataSource timeSheetDataSource;

  TimeSheetRepositoryImpl(this.timeSheetDataSource);

  // @override
  // Future<Either<Failure, TimeSheet>> getTimeSheet() async {
  //   try {
  //     final timeSheet = await timeSheetDataSource.getTimeSheet();
  //     return right(timeSheet);
  //   } catch (e) {
  //     return left(Failure(e.toString()));
  //   }
  // }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final users = await timeSheetDataSource.getUsers();
      if (users == null) {
        return left(Failure('Unable to get users list!'));
      }
      return right(users);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjects() async {
    try {
      final projects = await timeSheetDataSource.getProjects();
      if (projects == null) {
        return left(Failure('Unable to get projects list!'));
      }
      return right(projects);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<TypeClass>>> getTypes() async {
    try {
      final types = await timeSheetDataSource.getTypes();
      if (types == null) {
        return left(Failure('Unable to get types list!'));
      }
      return right(types);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MultiProject>>> getMultiProjects() async {
    try {
      final multiProjects = await timeSheetDataSource.getMultiProjects();
      if (multiProjects == null) {
        return left(Failure('Unable to get multi projects list!'));
      }
      return right(multiProjects);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Vehicle>>> getVehicles() async {
    try {
      final vehicles = await timeSheetDataSource.getVehicles();
      if (vehicles == null) {
        return left(Failure('Unable to get vehicles list!'));
      }
      return right(vehicles);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
