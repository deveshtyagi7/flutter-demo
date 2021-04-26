import 'dart:convert';

class CheckPhoneOtpModel {
  final int country_code;
  final int phone_number;
  final int otp;

  CheckPhoneOtpModel(this.country_code, this.phone_number, this.otp);

  Map<String, dynamic> toMap() {
    return {
      'country_code': country_code,
      'phone_number': phone_number,
      'otp': otp,
    };
  }

  factory CheckPhoneOtpModel.fromMap(Map<String, dynamic> map) {
    return CheckPhoneOtpModel(
      map['country_code'],
      map['phone_number'],
      map['otp'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckPhoneOtpModel.fromJson(String source) =>
      CheckPhoneOtpModel.fromMap(json.decode(source));
}
