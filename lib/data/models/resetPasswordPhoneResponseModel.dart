class ResetPasswordPhoneResponseModel {
  bool success;
  String errorMsg;

  ResetPasswordPhoneResponseModel({
    this.success,
    this.errorMsg,
  });

  ResetPasswordPhoneResponseModel.fromJson(Map<String, dynamic> json) {
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
