import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:parkingbud/data/data_sources/checkOtopDataSource.dart';
import 'package:parkingbud/data/data_sources/loginUserDataSource.dart';
import 'package:parkingbud/data/data_sources/requestOtpDataSource.dart';
import 'package:parkingbud/data/data_sources/resetPasswordDataSource.dart';
import 'package:parkingbud/data/data_sources/signUpDataSource.dart';
import 'package:parkingbud/data/models/loginResponseModel.dart';
import 'package:parkingbud/data/repositories/checkOtpRepositoryImpl.dart';
import 'package:parkingbud/data/repositories/getOtpRepositoryImpl.dart';
import 'package:parkingbud/data/repositories/loginRepositoryImpl.dart';
import 'package:parkingbud/data/repositories/resetPasswordRepositoryImpl.dart';
import 'package:parkingbud/data/repositories/signUpUserRepositoryImpl.dart';
import 'package:parkingbud/domain/repositories/checkOtpRepository.dart';
import 'package:parkingbud/domain/repositories/getOtpRepository.dart';
import 'package:parkingbud/domain/repositories/loginRepository.dart';
import 'package:parkingbud/domain/repositories/resetPasswordRepository.dart';
import 'package:parkingbud/domain/repositories/signUpRepository.dart';
import 'package:parkingbud/domain/usecase/checkOtpByEmailUseCase.dart';
import 'package:parkingbud/domain/usecase/checkOtpByPhoneUseCase.dart';
import 'package:parkingbud/domain/usecase/getOtpByEmailUseCase.dart';
import 'package:parkingbud/domain/usecase/getOtpByPhoneUseCase.dart';
import 'package:parkingbud/domain/usecase/loginByEmailUseCase.dart';
import 'package:parkingbud/domain/usecase/loginByPhoneNumber.dart';
import 'package:parkingbud/domain/usecase/loginBySociaMediaUseCase.dart';
import 'package:parkingbud/domain/usecase/resetPasswordByEmailUseCase.dart';
import 'package:parkingbud/domain/usecase/resetPasswordByPhoneUseCase.dart';
import 'package:parkingbud/domain/usecase/signUpUserUseCase.dart';
import 'package:parkingbud/presentation/journey/controller/email_sign_in_controller.dart';
import 'package:parkingbud/presentation/journey/controller/forget_password_controller.dart';
import 'package:parkingbud/presentation/journey/controller/reset_password_controller.dart';
import 'package:parkingbud/presentation/journey/controller/sign_in_controller.dart';
import 'package:parkingbud/presentation/journey/controller/sign_up_controller.dart';
import 'package:parkingbud/presentation/journey/controller/verification_controller.dart';

final getItInstance = GetIt.I;
Future init() {
  getItInstance.registerLazySingleton<Dio>(() => Dio());

//DATASOURCES
  getItInstance.registerLazySingleton<SignUpDataSourceImpl>(
      () => SignUpDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<CheckOtpDataSourceImpl>(
      () => CheckOtpDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<LoginDataSourceImpl>(
      () => LoginDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetUserOtpDataSourceImpl>(
      () => GetUserOtpDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<ResetPasswordDataSourceImpl>(
      () => ResetPasswordDataSourceImpl(getItInstance()));

//REPOSITORIES
  getItInstance.registerLazySingleton<SignUpUserRepository>(
      () => SignUpUserImpl(getItInstance()));

  getItInstance.registerLazySingleton<CheckOtpRepository>(
      () => CheckOtpRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetOtpRepository>(
      () => GetOtpRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImpl(getItInstance()));

//USECASES
  getItInstance.registerLazySingleton<CheckOtpByEmailUseCase>(
      () => CheckOtpByEmailUseCase(getItInstance()));

  getItInstance
      .registerLazySingleton<SignUpUser>(() => SignUpUser(getItInstance()));

  getItInstance.registerLazySingleton<CheckOtpByPhoneUseCase>(
      () => CheckOtpByPhoneUseCase(getItInstance()));

  getItInstance.registerLazySingleton<GetOtpByEmailUseCase>(
      () => GetOtpByEmailUseCase(getItInstance()));

  getItInstance.registerLazySingleton<GetOtpByPhoneUsecase>(
      () => GetOtpByPhoneUsecase(getItInstance()));

  getItInstance.registerLazySingleton<LoginByEmailUseCase>(
      () => LoginByEmailUseCase(getItInstance()));

  getItInstance.registerLazySingleton<LoginByPhoneNumberUseCase>(
      () => LoginByPhoneNumberUseCase(getItInstance()));

  getItInstance.registerLazySingleton<LoginBySocialMediaUseCase>(
      () => LoginBySocialMediaUseCase(getItInstance()));

  getItInstance.registerLazySingleton<ResetPasswordByEmailUseCase>(
      () => ResetPasswordByEmailUseCase(getItInstance()));

  getItInstance.registerLazySingleton<ResetPasswordByPhoneUseCase>(
      () => ResetPasswordByPhoneUseCase(getItInstance()));

  //CONTROLLERS
  getItInstance.registerLazySingleton<SignUpController>(
      () => SignUpController(getItInstance()));
  getItInstance.registerLazySingleton<SignInController>(
      () => SignInController(getItInstance()));
  getItInstance.registerLazySingleton<EmailSignInController>(
      () => EmailSignInController(getItInstance()));
  getItInstance.registerLazySingleton<VerificationController>(() =>
      VerificationController(
          getItInstance(), getItInstance(), getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton<ForgetPasswordController>(
      () => ForgetPasswordController());
  getItInstance.registerLazySingleton<ResetPasswordController>(
      () => ResetPasswordController(getItInstance(), getItInstance()));
}
