import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/core/usecase/usecase.dart';
import 'package:timesheet_app/features/home/domain/entities/user.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';

class GetUsers implements UseCase<List<User>, NoParams> {
  final TimeSheetRepository timeSheetRepository;

  GetUsers(this.timeSheetRepository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await timeSheetRepository.getUsers();
  }
}
