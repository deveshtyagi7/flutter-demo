import 'package:parkingbud/data/models/loginResponseModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/loginRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';

class LoginByPhoneNumberUseCase
    implements UseCase<LoginResponseModel, GetPhoneOtpModel> {
  final LoginRepository loginRepository;

  LoginByPhoneNumberUseCase(this.loginRepository);

  @override
  Future<Either<AppError, LoginResponseModel>> call(
      GetPhoneOtpModel params) async {
    return await loginRepository.loginUserByPhone(params);
  }
}
