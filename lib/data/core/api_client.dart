class HttpConfig {
  static const String baseURL =
      "http://ec2-18-216-249-214.us-east-2.compute.amazonaws.com:3000";

  static const String signUpUserApi = "$baseURL/signup_consumer_api";
  static const String loginByEmail = "$baseURL/login_consumer_api";
  static const String loginBySocialMedia =
      "$baseURL/login_with_email_consumer_api";
  static const String loginByPhoneNumber =
      "$baseURL/login_with_phone_number_consumer_api";
  static const String checkPhoneOtp = "$baseURL/check_phone_otp_consumer_api";
  static const String checkEmailOtp = "$baseURL/check_otp_consumer_api";
  static const String getEmailOtp = "$baseURL/send_otp_with_email_consumer_api";
  static const String getPhoneOtp = "$baseURL/send_otp_with_sms_consumer_api";
  static const String resetPasswordEmail =
      "$baseURL/change_password_with_otp_consumer_api";
  static const String resetPasswordPhone =
      "$baseURL/change_password_with_phone_otp_consumer_api";
}
