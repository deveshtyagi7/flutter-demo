class SignUpUserModel {
  final String phoneNumber;
  final String firstName;
  final String lastName;
  final String email;
  final String countryCode;
  final bool tsAagree;
  final String password;
  final String confirmPassword;

  SignUpUserModel(this.phoneNumber, this.firstName, this.lastName, this.email,
      this.countryCode, this.tsAagree, this.password, this.confirmPassword);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = Map();
    data["phone_number"] = this.phoneNumber;
    data["first_name"] = this.firstName;
    data["last_name"] = this.lastName;
    data["email"] = this.email;
    data["country_code"] = this.countryCode;
    data["ts_agree"] = this.tsAagree.toString();
    data["password"] = this.password;
    data["confirm_password"] = this.confirmPassword;
    return data;
  }
}
