import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/features/home/domain/entities/multiproject.dart';
import 'package:timesheet_app/features/home/domain/entities/project.dart';
import 'package:timesheet_app/features/home/domain/entities/timesheet.dart';
import 'package:timesheet_app/features/home/domain/entities/type.dart';
import 'package:timesheet_app/features/home/domain/entities/user.dart';
import 'package:timesheet_app/features/home/domain/entities/vehicle.dart';

abstract interface class TimeSheetRepository {
  //Future<Either<Failure, TimeSheet>> getTimeSheet();

  Future<Either<Failure, List<User>>> getUsers();

  Future<Either<Failure, List<Project>>> getProjects();

  Future<Either<Failure, List<TypeClass>>> getTypes();

  Future<Either<Failure, List<MultiProject>>> getMultiProjects();

  Future<Either<Failure, List<Vehicle>>> getVehicles();
}