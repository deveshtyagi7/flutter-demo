import 'package:parkingbud/data/data_sources/requestOtpDataSource.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/data/models/getOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/getOtpEmailResponseModel.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/getOtpRepository.dart';

class GetOtpRepositoryImpl extends GetOtpRepository {
  final GetUserOtpDataSourceImpl getUserOtpDataSourceImpl;

  GetOtpRepositoryImpl(this.getUserOtpDataSourceImpl);
  @override
  Future<Either<AppError, GetOtpEmailResponseModel>> getEmailOtp(
      GetEmailOtpModel getEmailOtpModel) async {
    try {
      return Right(
          await getUserOtpDataSourceImpl.getEmailOtp(getEmailOtpModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, GetOtpPhoneResponseModel>> getPhoneOtp(
      GetPhoneOtpModel getPhoneOtpModel) async {
    try {
      return Right(
          await getUserOtpDataSourceImpl.getPhoneOtp(getPhoneOtpModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }
}
