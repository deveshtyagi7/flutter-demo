import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:parkingbud/data/core/api_client.dart';
import 'package:parkingbud/data/models/request/signUpUserModel.dart';
import 'package:parkingbud/data/models/signUpResponseModel.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class SignUpUserDataSource {
  Future<SignUpResponseModel> signUpUser(SignUpUserModel user);
}

class SignUpDataSourceImpl extends SignUpUserDataSource {
  final Dio dio;
  SignUpDataSourceImpl(this.dio);
  @override
  Future<SignUpResponseModel> signUpUser(SignUpUserModel user) async {
    try {
      FormData formData = FormData.fromMap(user.toMap());
      var response = await dio.post(
        HttpConfig.signUpUserApi,
        data: formData,
        options: Options(
          headers: {"accept": "*/*", "content-type": "multipart/form-data"},
        ),
      );

      var data = response.data;
      debugPrint('This is data $data');
      return SignUpResponseModel.fromJson(data);
    } on Exception {
      throw Exception();
    }
  }
}
