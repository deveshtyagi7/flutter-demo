import 'dart:convert';

class LoginUserEmailModel {
  final String email;
  final String password;

  LoginUserEmailModel(this.email, this.password);

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginUserEmailModel.fromMap(Map<String, dynamic> map) {
    return LoginUserEmailModel(
      map['email'],
      map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserEmailModel.fromJson(String source) =>
      LoginUserEmailModel.fromMap(json.decode(source));
}
