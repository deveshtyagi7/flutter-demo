import 'package:dartz/dartz.dart';
import 'package:parkingbud/data/models/getOtpEmailResponseModel.dart';
import 'package:parkingbud/data/models/getOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';

abstract class GetOtpRepository {
  Future<Either<AppError, GetOtpEmailResponseModel>> getEmailOtp(
      GetEmailOtpModel getEmailOtpModel);
  Future<Either<AppError, GetOtpPhoneResponseModel>> getPhoneOtp(
      GetPhoneOtpModel getPhoneOtpModel);
}
