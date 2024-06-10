import 'dart:convert';

import 'package:timesheet_app/core/constants/urls/app_urls.dart';
import 'package:timesheet_app/core/error/exception.dart';
import 'package:timesheet_app/features/home/data/models/multiproject_model.dart';
import 'package:timesheet_app/features/home/data/models/projects_model.dart';
import 'package:timesheet_app/features/home/data/models/time_sheet_model.dart';
import 'package:http/http.dart' as http;
import 'package:timesheet_app/features/home/data/models/type_model.dart';
import 'package:timesheet_app/features/home/data/models/user_model.dart';
import 'package:timesheet_app/features/home/data/models/vehicle_model.dart';

abstract interface class TimeSheetDataSource {
  //Future<TimeSheetModel> getTimeSheet();
  Future<List<UserModel>?> getUsers();
  Future<List<ProjectsModel>?> getProjects();
  Future<List<TypeClassModel>?> getTypes();
  Future<List<MultiProjectModel>?> getMultiProjects();
  Future<List<VehicleModel>?> getVehicles();

}

class TimeSheetDataSourceImpl implements TimeSheetDataSource {
  // @override
  // Future<TimeSheetModel> getTimeSheet() async {
  //   const url = '$baseUrl/timesheet';
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       return TimeSheetModel.fromJson(json.decode(response.body));
  //     } else {
  //       throw ServerException('Failed to get time sheet');
  //     }
  //   } catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }

  @override
  Future<List<UserModel>?> getUsers() async {
    const url = '$newUrl/users';
    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['users'] as List<dynamic>;
        final users = jsonData.map((e) => UserModel.fromJson(e)).toList();
        return users;
      } else {
        throw ServerException('Failed to get users');
      }
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ProjectsModel>?> getProjects() async {
    const url = '$newUrl/projects';
    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['projects'] as List<dynamic>;
        final projects = jsonData.map((e) => ProjectsModel.fromJson(e)).toList();
        return projects;
      } else {
        throw ServerException('Failed to get projects');
      }
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<TypeClassModel>?> getTypes() async {
    const url = '$newUrl/types';
    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['types'] as List<dynamic>;
        final types = jsonData.map((e) => TypeClassModel.fromJson(e)).toList();
        return types;
      } else {
        throw ServerException('Failed to get types');
      }
    } on ServerException catch (e) {
      throw ServerException(e.message);
    }
  }

  @override
  Future<List<MultiProjectModel>?> getMultiProjects() async {
    const url = '$newUrl/multiprojects';
    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['multiprojects'] as List<dynamic>;
        print(jsonData);
        final multiProjects = jsonData.map((e) => MultiProjectModel.fromJson(e)).toList();
        print(multiProjects);
        return multiProjects;
      } else {
        throw ServerException('Failed to get multiprojects');
      }
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<VehicleModel>?> getVehicles() async {
    const url = '$newUrl/vehicles';
    try{
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body)['vehicles'] as List<dynamic>;
        final vehicles = jsonData.map((e) => VehicleModel.fromJson(e)).toList();
        return vehicles;
      } else {
        throw ServerException('Failed to get vehicles');
      }
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }
}