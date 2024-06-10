import 'package:timesheet_app/features/home/domain/entities/lodging.dart';

class Staff {
  final String staffName;
  final Lodging lodging;
  final String comment;
  final String tasks;
  final String accommodation;
  final String perDiem;
  final String startDay;
  final String arriveField;
  final String departField;
  final String endDay;

  Staff({
    required this.staffName,
    required this.lodging,
    required this.comment,
    required this.tasks,
    required this.accommodation,
    required this.perDiem,
    required this.startDay,
    required this.arriveField,
    required this.departField,
    required this.endDay,
  });
}
