import 'dart:convert';

class GetEmailOtpModel {
  final String email;

  GetEmailOtpModel(this.email);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  factory GetEmailOtpModel.fromMap(Map<String, dynamic> map) {
    return GetEmailOtpModel(
      map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetEmailOtpModel.fromJson(String source) =>
      GetEmailOtpModel.fromMap(json.decode(source));
}
