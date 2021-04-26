import 'package:parkingbud/data/models/request/resetPasswordEmail.dart';
import 'package:parkingbud/data/models/resetPasswordEmailResponseModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/resetPasswordRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';

class ResetPasswordByEmailUseCase
    implements
        UseCase<ResetPasswordEmailResponseModel, ResetPasswordEmailModel> {
  final ResetPasswordRepository resetPasswordRepository;

  ResetPasswordByEmailUseCase(this.resetPasswordRepository);

  @override
  Future<Either<AppError, ResetPasswordEmailResponseModel>> call(
      ResetPasswordEmailModel params) async {
    return await resetPasswordRepository.resetPasswordByEmail(params);
  }
}
