import 'package:parkingbud/domain/entities/signUpResponseEntity.dart';

class SignUpResponseModel extends SignUpResponseEntity {
  final bool success;
  final String errorMsg;
  // final String errors;
  // final String response;

  //THIS IS FOR CONSTRUCTORSJ
// this.errors, this.response
  SignUpResponseModel({
    this.success,
    this.errorMsg,
  }) : super(success, errorMsg);

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      success: json['success'] == "true" ? true : false,
      errorMsg: json['error_msg'],
      // errors: json['errors'],
      // response: json['response']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_msg'] = this.errorMsg;
    // data['errors'] = this.errors;
    // data['response'] = this.response;
    return data;
  }
}
