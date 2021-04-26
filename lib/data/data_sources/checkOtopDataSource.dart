import 'package:parkingbud/data/core/api_client.dart';
import 'package:parkingbud/data/models/checkOtpEmailResponseModel.dart';
import 'package:parkingbud/data/models/checkOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/request/checkEmailOtpModel.dart';
import 'package:dio/dio.dart';
import 'package:parkingbud/data/models/request/checkPhoneOtpModel.dart';

abstract class CheckOtpDataSource {
  Future<CheckOtpEmailResponseModel> checkEmailOtp(
      CheckEmailOptModel checkEmailOptModel);
  Future<CheckOtpPhoneResponseModel> checkPhoneOtp(
      CheckPhoneOtpModel checkPhoneOtpModel);
}

class CheckOtpDataSourceImpl extends CheckOtpDataSource {
  final Dio dio;
  CheckOtpDataSourceImpl(this.dio);
  @override
  Future<CheckOtpEmailResponseModel> checkEmailOtp(
      CheckEmailOptModel checkEmailOptModel) async {
    try {
      FormData formData = FormData.fromMap(checkEmailOptModel.toMap());
      var response = await dio.post(
        HttpConfig.checkEmailOtp,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return CheckOtpEmailResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<CheckOtpPhoneResponseModel> checkPhoneOtp(
      CheckPhoneOtpModel checkPhoneOtpModel) async {
    try {
      FormData formData = FormData.fromMap(checkPhoneOtpModel.toMap());
      var response = await dio.post(
        HttpConfig.checkPhoneOtp,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return CheckOtpPhoneResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }
}
