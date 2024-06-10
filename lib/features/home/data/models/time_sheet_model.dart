import 'package:timesheet_app/features/home/domain/entities/timesheet.dart';

class TimeSheetModel extends TimeSheet {
  TimeSheetModel({
    super.users,
    super.projects,
    super.type,
    super.vehicles,
    super.startKm,
    super.endKm,
    super.multiProjects,
    super.note,
  });

  // factory TimeSheetModel.fromJson(Map<String, dynamic> json) {
  //   return TimeSheetModel(
  //     users: ,
  //     projects: json['projects'] as List<String>,
  //     type: json['type'] as List<String>,
  //     vehicles: json['vehicles'] as List<String>,
  //     startKm: json['startKm'] as int,
  //     endKm: json['endKm'] as int,
  //     multiProjects: json['multiProjects'] as List<String>,
  //     note: json['note'] as String,
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      'users': users,
      'projects': projects,
      'type': type,
      'vehicles': vehicles,
      'startKm': startKm,
      'endKm': endKm,
      'multiProjects': multiProjects,
      'note': note,
    };
  }

  // TimeSheetModel copyWith({
  //   List<String>? users,
  //   List<String>? projects,
  //   List<String>? type,
  //   List<String>? vehicles,
  //   int? startKm,
  //   int? endKm,
  //   List<String>? multiProjects,
  //   String? note,
  // }) {
  //   return TimeSheetModel(
  //     users: users ?? this.users,
  //     projects: projects ?? this.projects,
  //     type: type ?? this.type,
  //     vehicles: vehicles ?? this.vehicles,
  //     startKm: startKm ?? this.startKm,
  //     endKm: endKm ?? this.endKm,
  //     multiProjects: multiProjects ?? this.multiProjects,
  //     note: note ?? this.note,
  //   );
  // }
}
