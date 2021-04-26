import 'package:parkingbud/data/models/request/resetPasswordPhone.dart';
import 'package:parkingbud/data/models/resetPasswordPhoneResponseModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/resetPasswordRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';

class ResetPasswordByPhoneUseCase
    implements
        UseCase<ResetPasswordPhoneResponseModel, ResetPasswordPhoneModel> {
  final ResetPasswordRepository resetPasswordRepository;

  ResetPasswordByPhoneUseCase(this.resetPasswordRepository);

  @override
  Future<Either<AppError, ResetPasswordPhoneResponseModel>> call(
      ResetPasswordPhoneModel params) async {
    return await resetPasswordRepository.resetPasswordByPhone(params);
  }
}
