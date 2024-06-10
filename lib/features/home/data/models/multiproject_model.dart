import 'package:timesheet_app/features/home/domain/entities/multiproject.dart';

class MultiProjectModel extends MultiProject{
  MultiProjectModel({required super.multiProject});

  factory MultiProjectModel.fromJson(Map<String, dynamic> json) {
    return MultiProjectModel(
      multiProject: json['multiproject'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'multiproject': multiProject,
    };
  }
}