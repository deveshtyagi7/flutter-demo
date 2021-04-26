import 'package:parkingbud/data/data_sources/resetPasswordDataSource.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/data/models/resetPasswordPhoneResponseModel.dart';
import 'package:parkingbud/data/models/resetPasswordEmailResponseModel.dart';
import 'package:parkingbud/data/models/request/resetPasswordPhone.dart';
import 'package:parkingbud/data/models/request/resetPasswordEmail.dart';
import 'package:parkingbud/domain/repositories/resetPasswordRepository.dart';

class ResetPasswordRepositoryImpl extends ResetPasswordRepository {
  final ResetPasswordDataSourceImpl resetPasswordDataSourceImpl;

  ResetPasswordRepositoryImpl(this.resetPasswordDataSourceImpl);
  @override
  Future<Either<AppError, ResetPasswordEmailResponseModel>>
      resetPasswordByEmail(
          ResetPasswordEmailModel resetPasswordEmailModel) async {
    try {
      return Right(await resetPasswordDataSourceImpl
          .resetPasswordEmail(resetPasswordEmailModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, ResetPasswordPhoneResponseModel>>
      resetPasswordByPhone(
          ResetPasswordPhoneModel resetPasswordPhoneModel) async {
    try {
      return Right(await resetPasswordDataSourceImpl
          .resetPasswordPhone(resetPasswordPhoneModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }
}
