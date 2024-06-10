import 'package:timesheet_app/features/home/domain/entities/multiproject.dart';
import 'package:timesheet_app/features/home/domain/entities/project.dart';
import 'package:timesheet_app/features/home/domain/entities/type.dart';
import 'package:timesheet_app/features/home/domain/entities/user.dart';
import 'package:timesheet_app/features/home/domain/entities/vehicle.dart';

class TimeSheet {
  final List<User>? users;
  final List<Project>? projects;
  final List<TypeClass>? type;
  final List<Vehicle>? vehicles;
  final int? startKm;
  final int? endKm;
  final List<MultiProject>? multiProjects;
  final String? note;

  TimeSheet({
    this.users,
    this.projects,
    this.type,
    this.vehicles,
    this.startKm,
    this.endKm,
    this.multiProjects,
    this.note,
  });
}
