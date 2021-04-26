import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verify_by_email.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verify_by_phone.dart';

enum VerifyThrough { email, phone }

class ForgetPasswordController extends GetxController {
  VerifyThrough character = VerifyThrough.phone;

  void navigatePage() {
    Get.toNamed(character == VerifyThrough.phone
        ? VerificationPhone.routeName
        : VerificationEmail.routeName);
  }

  changeCharacter(VerifyThrough value) {
    character = value;
    update();
  }
}
