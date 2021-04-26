import 'package:dartz/dartz.dart';
import 'package:parkingbud/data/models/request/resetPasswordEmail.dart';
import 'package:parkingbud/data/models/request/resetPasswordPhone.dart';
import 'package:parkingbud/data/models/resetPasswordEmailResponseModel.dart';
import 'package:parkingbud/data/models/resetPasswordPhoneResponseModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';

abstract class ResetPasswordRepository {
  Future<Either<AppError, ResetPasswordPhoneResponseModel>>
      resetPasswordByPhone(ResetPasswordPhoneModel resetPasswordPhoneModel);
  Future<Either<AppError, ResetPasswordEmailResponseModel>>
      resetPasswordByEmail(ResetPasswordEmailModel resetPasswordEmailModel);
}
