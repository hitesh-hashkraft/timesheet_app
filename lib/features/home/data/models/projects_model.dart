import 'package:timesheet_app/features/home/domain/entities/project.dart';

class ProjectsModel extends Project {
  ProjectsModel({required super.projectName});

  factory ProjectsModel.fromJson(Map<String, dynamic> json) {
    return ProjectsModel(
      projectName: json['project_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'project_name': projectName,
    };
  }
}
