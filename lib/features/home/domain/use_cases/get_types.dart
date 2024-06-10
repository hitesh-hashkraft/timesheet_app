import 'package:fpdart/fpdart.dart';
import 'package:timesheet_app/core/error/failure.dart';
import 'package:timesheet_app/core/usecase/usecase.dart';
import 'package:timesheet_app/features/home/domain/entities/type.dart';
import 'package:timesheet_app/features/home/domain/repositories/timesheet_repository.dart';

class GetTypes implements UseCase<List<TypeClass>, NoParams>{
  final TimeSheetRepository timeSheetRepository;

  GetTypes(this.timeSheetRepository);

  @override
  Future<Either<Failure, List<TypeClass>>> call(NoParams params) async {
    return timeSheetRepository.getTypes();
  }

}