import 'package:parkingbud/data/models/loginResponseModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/loginRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';

class LoginBySocialMediaUseCase
    implements UseCase<LoginResponseModel, GetEmailOtpModel> {
  final LoginRepository loginRepository;

  LoginBySocialMediaUseCase(this.loginRepository);

  @override
  Future<Either<AppError, LoginResponseModel>> call(
      GetEmailOtpModel params) async {
    return await loginRepository.loginUserBySocialMedia(params);
  }
}
