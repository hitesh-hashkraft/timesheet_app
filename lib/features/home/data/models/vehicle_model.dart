import 'package:timesheet_app/features/home/domain/entities/vehicle.dart';

class VehicleModel extends Vehicle {
  VehicleModel({required super.vehicleName});

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      vehicleName: json['vehicle_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vehicle_name': vehicleName,
    };
  }
}