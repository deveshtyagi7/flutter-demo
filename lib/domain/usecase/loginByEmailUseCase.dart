import 'package:parkingbud/data/models/loginResponseModel.dart';
import 'package:parkingbud/data/models/request/loginUserEmailModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/loginRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';

class LoginByEmailUseCase
    implements UseCase<LoginResponseModel, LoginUserEmailModel> {
  final LoginRepository loginRepository;

  LoginByEmailUseCase(this.loginRepository);

  @override
  Future<Either<AppError, LoginResponseModel>> call(
      LoginUserEmailModel params) async {
    return await loginRepository.loginUserByEmail(params);
  }
}
