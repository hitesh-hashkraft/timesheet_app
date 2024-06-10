import 'package:timesheet_app/features/home/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.username});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': username,
    };
  }
}
