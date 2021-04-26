import 'package:parkingbud/data/models/getOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:parkingbud/domain/repositories/getOtpRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetOtpByPhoneUsecase
    implements UseCase<GetOtpPhoneResponseModel, GetPhoneOtpModel> {
  final GetOtpRepository getOtpRepository;

  GetOtpByPhoneUsecase(this.getOtpRepository);

  @override
  Future<Either<AppError, GetOtpPhoneResponseModel>> call(
      GetPhoneOtpModel params) async {
    return await getOtpRepository.getPhoneOtp(params);
  }
}
