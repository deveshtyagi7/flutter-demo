class LoginResponseModel {
  bool success;
  String errorMsg;
  Response response;
  String token;

  LoginResponseModel({this.success, this.errorMsg, this.response, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] == "true" ? true : false;
    errorMsg = json['error_msg'];
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error_msg'] = this.errorMsg;
    if (this.response != null) {
      data['response'] = this.response.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Response {
  String user;

  Response({this.user});

  Response.fromJson(Map<String, dynamic> json) {
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    return data;
  }
}
