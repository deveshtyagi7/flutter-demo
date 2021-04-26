import 'package:parkingbud/data/models/getOtpEmailResponseModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/domain/repositories/getOtpRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';

class GetOtpByEmailUseCase
    implements UseCase<GetOtpEmailResponseModel, GetEmailOtpModel> {
  final GetOtpRepository getOtpRepository;

  GetOtpByEmailUseCase(this.getOtpRepository);

  @override
  Future<Either<AppError, GetOtpEmailResponseModel>> call(
      GetEmailOtpModel params) async {
    return await getOtpRepository.getEmailOtp(params);
  }
}
