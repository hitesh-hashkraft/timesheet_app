import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/core/usecase/usecase.dart';
import 'package:timesheet_app/features/home/domain/entities/project.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';

class GetProjects implements UseCase<List<Project>, NoParams> {
  final TimeSheetRepository timeSheetRepository;

  GetProjects(this.timeSheetRepository);

  @override
  Future<Either<Failure, List<Project>>> call(NoParams params) async {
    return await timeSheetRepository.getProjects();
  }
}
