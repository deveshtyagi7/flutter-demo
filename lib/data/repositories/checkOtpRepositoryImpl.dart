import 'package:parkingbud/data/data_sources/checkOtopDataSource.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:parkingbud/data/models/request/checkPhoneOtpModel.dart';
import 'package:parkingbud/data/models/request/checkEmailOtpModel.dart';
import 'package:parkingbud/data/models/checkOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/checkOtpEmailResponseModel.dart';
import 'package:parkingbud/domain/repositories/checkOtpRepository.dart';

class CheckOtpRepositoryImpl extends CheckOtpRepository {
  final CheckOtpDataSourceImpl checkOtpDataSourceImpl;

  CheckOtpRepositoryImpl(this.checkOtpDataSourceImpl);
  @override
  Future<Either<AppError, CheckOtpEmailResponseModel>> checkEmailOtp(
      CheckEmailOptModel checkEmailOptModel) async {
    try {
      return Right(
          await checkOtpDataSourceImpl.checkEmailOtp(checkEmailOptModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, CheckOtpPhoneResponseModel>> checkPhoneOtp(
      CheckPhoneOtpModel checkPhoneOtpModel) async {
    try {
      return Right(
          await checkOtpDataSourceImpl.checkPhoneOtp(checkPhoneOtpModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }
}
