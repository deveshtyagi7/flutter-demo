import 'package:parkingbud/data/data_sources/signUpDataSource.dart';
import 'package:parkingbud/data/models/request/signUpUserModel.dart';
import 'package:parkingbud/domain/entities/signUpResponseEntity.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:parkingbud/domain/repositories/signUpRepository.dart';

class SignUpUserImpl extends SignUpUserRepository {
  final SignUpDataSourceImpl signUpDataSourceImpl;

  SignUpUserImpl(this.signUpDataSourceImpl);
  @override
  Future<Either<AppError, SignUpResponseEntity>> signUpUser(
      SignUpUserModel signUpUserEntity) async {
    try {
      return Right(await signUpDataSourceImpl.signUpUser(signUpUserEntity));
    } on Exception {
      return Left(AppError(AppErrorType.network));
    }
  }
}
