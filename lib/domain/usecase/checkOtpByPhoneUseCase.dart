import 'package:parkingbud/data/models/checkOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/request/checkPhoneOtpModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/checkOtpRepository.dart';

import 'package:parkingbud/domain/usecase/usecase.dart';

class CheckOtpByPhoneUseCase
    implements UseCase<CheckOtpPhoneResponseModel, CheckPhoneOtpModel> {
  final CheckOtpRepository checkOtpRepository;

  CheckOtpByPhoneUseCase(this.checkOtpRepository);

  @override
  Future<Either<AppError, CheckOtpPhoneResponseModel>> call(
      CheckPhoneOtpModel params) async {
    return await checkOtpRepository.checkPhoneOtp(params);
  }
}
