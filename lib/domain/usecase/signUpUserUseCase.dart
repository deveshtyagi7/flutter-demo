import 'package:parkingbud/data/models/request/signUpUserModel.dart';

import 'package:parkingbud/domain/entities/signUpResponseEntity.dart';
import 'package:parkingbud/domain/repositories/signUpRepository.dart';
import 'package:parkingbud/domain/usecase/usecase.dart';

import 'package:parkingbud/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
class SignUpUser implements UseCase<SignUpResponseEntity, SignUpUserModel> {
  final SignUpUserRepository signUpUserRepository;

  SignUpUser(this.signUpUserRepository);

  @override
  Future<Either<AppError, SignUpResponseEntity>> call(
      SignUpUserModel params) async {
    return await signUpUserRepository.signUpUser(params);
  }
}
