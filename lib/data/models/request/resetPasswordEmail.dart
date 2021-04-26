import 'dart:convert';

class ResetPasswordEmailModel {
  final int otp;
  final String email;
  final String password;
  final String confirm_password;

  ResetPasswordEmailModel(
      this.otp, this.email, this.password, this.confirm_password);

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'email': email,
      'password': password,
      'confirm_password': confirm_password,
    };
  }

  factory ResetPasswordEmailModel.fromMap(Map<String, dynamic> map) {
    return ResetPasswordEmailModel(
      map['otp'],
      map['email'],
      map['password'],
      map['confirm_password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResetPasswordEmailModel.fromJson(String source) =>
      ResetPasswordEmailModel.fromMap(json.decode(source));
}
