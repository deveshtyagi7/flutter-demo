import 'package:parkingbud/data/models/loginResponseModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/data/models/request/loginUserEmailModel.dart';
import 'package:parkingbud/data/core/api_client.dart';
import 'package:dio/dio.dart';

abstract class LoginUserDataSource {
  Future<LoginResponseModel> loginUserEmail(
      LoginUserEmailModel loginUserEmailModel);
  Future<LoginResponseModel> loginUserSocialMedia(
      GetEmailOtpModel getEmailOtpModel);
  Future<LoginResponseModel> loginUserPhoneNumber(
      GetPhoneOtpModel getPhoneOtpModel);
}

class LoginDataSourceImpl extends LoginUserDataSource {
  final Dio dio;

  LoginDataSourceImpl(this.dio);

  @override
  Future<LoginResponseModel> loginUserEmail(
      LoginUserEmailModel loginUserEmailModel) async {
    try {
      FormData formData = FormData.fromMap(loginUserEmailModel.toMap());
      var response = await dio.post(
        HttpConfig.loginByEmail,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return LoginResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<LoginResponseModel> loginUserPhoneNumber(
      GetPhoneOtpModel getPhoneOtpModel) async {
    try {
      FormData formData = FormData.fromMap(getPhoneOtpModel.toMap());
      var response = await dio.post(
        HttpConfig.loginByPhoneNumber,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return LoginResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<LoginResponseModel> loginUserSocialMedia(
      GetEmailOtpModel getEmailOtpModel) async {
    try {
      FormData formData = FormData.fromMap(getEmailOtpModel.toMap());
      var response = await dio.post(
        HttpConfig.loginBySocialMedia,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return LoginResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }
}
