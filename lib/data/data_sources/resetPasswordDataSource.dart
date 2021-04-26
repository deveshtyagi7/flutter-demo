import 'package:dio/dio.dart';
import 'package:parkingbud/data/core/api_client.dart';
import 'package:parkingbud/data/models/request/resetPasswordEmail.dart';
import 'package:parkingbud/data/models/request/resetPasswordPhone.dart';
import 'package:parkingbud/data/models/resetPasswordEmailResponseModel.dart';
import 'package:parkingbud/data/models/resetPasswordPhoneResponseModel.dart';

abstract class ResetPasswordDataSource {
  Future<ResetPasswordEmailResponseModel> resetPasswordEmail(
      ResetPasswordEmailModel resetPasswordEmailModel);
  Future<ResetPasswordPhoneResponseModel> resetPasswordPhone(
      ResetPasswordPhoneModel resetPasswordPhoneModel);
}

class ResetPasswordDataSourceImpl extends ResetPasswordDataSource {
  final Dio dio;

  ResetPasswordDataSourceImpl(this.dio);

  @override
  Future<ResetPasswordEmailResponseModel> resetPasswordEmail(
      ResetPasswordEmailModel resetPasswordEmailModel) async {
    try {
      FormData formData = FormData.fromMap(resetPasswordEmailModel.toMap());
      var response = await dio.post(
        HttpConfig.resetPasswordEmail,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return ResetPasswordEmailResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<ResetPasswordPhoneResponseModel> resetPasswordPhone(
      ResetPasswordPhoneModel resetPasswordPhoneModel) async {
    try {
      FormData formData = FormData.fromMap(resetPasswordPhoneModel.toMap());
      var response = await dio.post(
        HttpConfig.resetPasswordPhone,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return ResetPasswordPhoneResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }
}
