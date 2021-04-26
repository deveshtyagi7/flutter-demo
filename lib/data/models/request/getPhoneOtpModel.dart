import 'dart:convert';

class GetPhoneOtpModel {
  final int country_code;
  final int phone_number;

  GetPhoneOtpModel(this.country_code, this.phone_number);

  Map<String, dynamic> toMap() {
    return {
      'country_code': country_code,
      'phone_number': phone_number,
    };
  }

  factory GetPhoneOtpModel.fromMap(Map<String, dynamic> map) {
    return GetPhoneOtpModel(
      map['country_code'],
      map['phone_number'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPhoneOtpModel.fromJson(String source) =>
      GetPhoneOtpModel.fromMap(json.decode(source));
}
