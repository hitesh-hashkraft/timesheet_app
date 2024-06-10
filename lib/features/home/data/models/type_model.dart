import 'package:timesheet_app/features/home/domain/entities/type.dart';

class TypeClassModel extends TypeClass {
  TypeClassModel({required super.typeName});

  factory TypeClassModel.fromJson(Map<String, dynamic> json) {
    return TypeClassModel(
      typeName: json['type_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type_name': typeName,
    };
  }
}
