import 'dart:convert';

class CheckEmailOptModel {
  final int otp;
  final String email;
  CheckEmailOptModel(
    this.otp,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return {
      'otp': otp,
      'email': email,
    };
  }

  factory CheckEmailOptModel.fromMap(Map<String, dynamic> map) {
    return CheckEmailOptModel(
      map['otp'],
      map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckEmailOptModel.fromJson(String source) =>
      CheckEmailOptModel.fromMap(json.decode(source));
}
