import 'package:parkingbud/data/models/checkOtpEmailResponseModel.dart';
import 'package:parkingbud/data/models/checkOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/request/checkEmailOtpModel.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/data/models/request/checkPhoneOtpModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';

abstract class CheckOtpRepository {
  Future<Either<AppError, CheckOtpEmailResponseModel>> checkEmailOtp(
      CheckEmailOptModel checkEmailOptModel);
  Future<Either<AppError, CheckOtpPhoneResponseModel>> checkPhoneOtp(
      CheckPhoneOtpModel checkPhoneOtpModel);
}
