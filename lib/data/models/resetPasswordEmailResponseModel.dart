class ResetPasswordEmailResponseModel {
  bool success;
  String errorMsg;

  ResetPasswordEmailResponseModel({
    this.success,
    this.errorMsg,
  });

  ResetPasswordEmailResponseModel.fromJson(Map<String, dynamic> json) {
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
