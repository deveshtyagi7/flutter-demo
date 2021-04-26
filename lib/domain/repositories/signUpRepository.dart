import 'package:dartz/dartz.dart';
import 'package:parkingbud/data/models/request/signUpUserModel.dart';
import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:parkingbud/domain/entities/signUpResponseEntity.dart';

abstract class SignUpUserRepository {
  Future<Either<AppError, SignUpResponseEntity>> signUpUser(
      SignUpUserModel signUpUserModel);
}
