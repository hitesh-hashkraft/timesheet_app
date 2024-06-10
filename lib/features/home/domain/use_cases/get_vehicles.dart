import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/core/usecase/usecase.dart';
import 'package:timesheet_app/features/home/domain/entities/vehicle.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';

class GetVehicles implements UseCase<List<Vehicle>, NoParams> {
  final TimeSheetRepository timeSheetRepository;

  GetVehicles(this.timeSheetRepository);

  @override
  Future<Either<Failure, List<Vehicle>>> call(NoParams params) async {
    return await timeSheetRepository.getVehicles();
  }
}
