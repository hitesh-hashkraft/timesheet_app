import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/core/usecase/usecase.dart';
import 'package:timesheet_app/features/home/domain/entities/multiproject.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';

class GetMultiProjects implements UseCase <List<MultiProject>, NoParams> {
  final TimeSheetRepository timeSheetRepository;

  GetMultiProjects(this.timeSheetRepository);
  @override
  Future<Either<Failure, List<MultiProject>>> call(NoParams params) async {
    return await timeSheetRepository.getMultiProjects();
  }
}