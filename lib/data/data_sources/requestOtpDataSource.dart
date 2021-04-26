import 'package:dio/dio.dart';
import 'package:parkingbud/data/core/api_client.dart';
import 'package:parkingbud/data/models/getOtpEmailResponseModel.dart';
import 'package:parkingbud/data/models/getOtpPhoneResponseModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';

abstract class GetUserOtpDataSource {
  Future<GetOtpEmailResponseModel> getEmailOtp(
      GetEmailOtpModel getEmailOtpModel);
  Future<GetOtpPhoneResponseModel> getPhoneOtp(
      GetPhoneOtpModel getPhoneOtpModel);
}

class GetUserOtpDataSourceImpl extends GetUserOtpDataSource {
  final Dio dio;

  GetUserOtpDataSourceImpl(this.dio);

  @override
  Future<GetOtpEmailResponseModel> getEmailOtp(
      GetEmailOtpModel getEmailOtpModel) async {
    try {
      FormData formData = FormData.fromMap(getEmailOtpModel.toMap());
      var response = await dio.post(
        HttpConfig.getEmailOtp,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return GetOtpEmailResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }

  @override
  Future<GetOtpPhoneResponseModel> getPhoneOtp(
      GetPhoneOtpModel getPhoneOtpModel) async {
    try {
      FormData formData = FormData.fromMap(getPhoneOtpModel.toMap());
      var response = await dio.post(
        HttpConfig.getPhoneOtp,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );
      var data = response.data;
      return GetOtpPhoneResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }
}
