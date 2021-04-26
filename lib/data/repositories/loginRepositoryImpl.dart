import 'package:parkingbud/data/data_sources/loginUserDataSource.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/data/models/request/loginUserEmailModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/data/models/loginResponseModel.dart';
import 'package:parkingbud/domain/repositories/loginRepository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSourceImpl loginDataSourceImpl;

  LoginRepositoryImpl(this.loginDataSourceImpl);
  @override
  Future<Either<AppError, LoginResponseModel>> loginUserByEmail(
      LoginUserEmailModel loginUserEmailModel) async {
    try {
      return Right(
          await loginDataSourceImpl.loginUserEmail(loginUserEmailModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, LoginResponseModel>> loginUserByPhone(
      GetPhoneOtpModel getPhoneOtpModel) async {
    try {
      return Right(
          await loginDataSourceImpl.loginUserPhoneNumber(getPhoneOtpModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }

  @override
  Future<Either<AppError, LoginResponseModel>> loginUserBySocialMedia(
      GetEmailOtpModel getEmailOtpModel) async {
    try {
      return Right(
          await loginDataSourceImpl.loginUserSocialMedia(getEmailOtpModel));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }
}
