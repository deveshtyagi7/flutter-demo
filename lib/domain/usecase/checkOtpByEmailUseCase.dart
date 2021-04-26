import 'package:parkingbud/data/models/checkOtpEmailResponseModel.dart';
import 'package:parkingbud/data/models/request/checkEmailOtpModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/checkOtpRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';

class CheckOtpByEmailUseCase
    implements UseCase<CheckOtpEmailResponseModel, CheckEmailOptModel> {
  final CheckOtpRepository checkOtpRepository;
  CheckOtpByEmailUseCase(this.checkOtpRepository);

  @override
  Future<Either<AppError, CheckOtpEmailResponseModel>> call(
      CheckEmailOptModel params) async {
    return await checkOtpRepository.checkEmailOtp(params);
  }
}
