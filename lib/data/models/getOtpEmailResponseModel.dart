class GetOtpEmailResponseModel {
  bool success;
  String errorMsg;

  GetOtpEmailResponseModel({this.success, this.errorMsg});

  GetOtpEmailResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] == "true" ? true : false;
    errorMsg = json['error_msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_msg'] = this.errorMsg;
    return data;
  }
}
