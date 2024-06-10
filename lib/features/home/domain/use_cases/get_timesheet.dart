import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/core/usecase/usecase.dart';
import 'package:timesheet_app/features/home/domain/entities/timesheet.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';

// class GetTimeSheet implements UseCase<TimeSheet, NoParams> {
//   final TimeSheetRepository timeSheetRepository;
//
//   GetTimeSheet(this.timeSheetRepository);
//   @override
//   Future<Either<Failure, TimeSheet>> call(NoParams params) async {
//     return await timeSheetRepository.getTimeSheet();
//   }
// }
