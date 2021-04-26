import 'package:dartz/dartz.dart';
import 'package:parkingbud/data/models/loginResponseModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/data/models/request/loginUserEmailModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';

abstract class LoginRepository {
  Future<Either<AppError, LoginResponseModel>> loginUserByEmail(
      LoginUserEmailModel loginUserEmailModel);
  Future<Either<AppError, LoginResponseModel>> loginUserByPhone(
      GetPhoneOtpModel getPhoneOtpModel);
  Future<Either<AppError, LoginResponseModel>> loginUserBySocialMedia(
      GetEmailOtpModel getEmailOtpModel);
}
