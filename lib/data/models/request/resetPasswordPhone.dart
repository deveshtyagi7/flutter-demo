import 'dart:convert';

class ResetPasswordPhoneModel {
  final int otp;
  final int country_code;
  final int phone_number;
  final String password;
  final String confirm_password;

  ResetPasswordPhoneModel(this.otp, this.country_code, this.phone_number,
      this.password, this.confirm_password);

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'country_code': country_code,
      'phone_number': phone_number,
      'password': password,
      'confirm_password': confirm_password,
    };
  }

  factory ResetPasswordPhoneModel.fromMap(Map<String, dynamic> map) {
    return ResetPasswordPhoneModel(
      map['otp'],
      map['country_code'],
      map['phone_number'],
      map['password'],
      map['confirm_password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordPhoneModel.fromJson(String source) =>
      ResetPasswordPhoneModel.fromMap(json.decode(source));
}
