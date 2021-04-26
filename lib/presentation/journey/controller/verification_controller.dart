import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parkingbud/data/models/request/checkEmailOtpModel.dart';
import 'package:parkingbud/data/models/request/checkPhoneOtpModel.dart';
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/data/models/request/getPhoneOtpModel.dart';
import 'package:parkingbud/domain/usecase/checkOtpByEmailUseCase.dart';
import 'package:parkingbud/domain/usecase/checkOtpByPhoneUseCase.dart';
import 'package:parkingbud/domain/usecase/getOtpByEmailUseCase.dart';
import 'package:parkingbud/domain/usecase/getOtpByPhoneUseCase.dart';
import 'package:parkingbud/presentation/journey/page/reset_password/passwordReset.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verification_code.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verification_sent.dart';

class VerificationController extends GetxController {
  final GetOtpByEmailUseCase getOtpByEmailUseCase;
  final GetOtpByPhoneUsecase getOtpByPhoneUseCase;
  final CheckOtpByPhoneUseCase checkOtpByPhoneUseCase;
  final CheckOtpByEmailUseCase checkOtpByEmailUseCase;

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> phoneKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();

  String verificationType;
  int countryCode = 1;
  String userEmail = "";
  int phoneNumber;
  int otp;
  VerificationController(this.getOtpByEmailUseCase, this.getOtpByPhoneUseCase,
      this.checkOtpByPhoneUseCase, this.checkOtpByEmailUseCase);
  @override
  void onInit() {
    super.onInit();
  }

  emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return '⚠ Please enter a valid email!';
    }
    return null;
  }

  phoneNumberValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$")
            .hasMatch(value) ||
        value.trim().length != 10) {
      return '⚠ Enter a valid phone number!';
    }
    return null;
  }

  navigateToVerifyCodeByPhone() async {
    if (phoneKey.currentState.validate()) {
      phoneNumber = int.parse(phoneNumberController.text);
      var data = await getOtpByPhoneUseCase(
          GetPhoneOtpModel(countryCode, phoneNumber));
      data.fold((l) {
        debugPrint("THe error is as: $l");
      }, (r) {
        debugPrint("THe data is as ${r.success}");
        if (r.success == true) {
          goToVerficiationCode("phone");
        } else {
          Get.snackbar("Error", "${r.errorMsg}",
              colorText: Colors.white,
              titleText: Center(
                  child: Text("Error",
                      style: Get.textTheme.headline6.copyWith(
                        color: Colors.white,
                      ))),
              messageText: Center(
                child: Text("${r.errorMsg}",
                    style: Get.textTheme.headline6
                        .copyWith(color: Colors.white, fontSize: 16)),
              ),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red);
        }
      });
    }

    // Get.to(VerificationCode(
    //   verificationType: "phone",
    // ));
    update();
  }
  // Get.toNamed();

  navigateToVerifyCodeByEmail() async {
    if (emailKey.currentState.validate()) {
      userEmail = emailController.text;
      var data = await getOtpByEmailUseCase(GetEmailOtpModel(userEmail));
      data.fold((l) {
        debugPrint("THe error is as: $l");
      }, (r) {
        debugPrint("THe data is as ${r.success}");
        if (r.success == true) {
          Get.toNamed(VerificationSent.routeName);
        } else {
          Get.snackbar("Error", "${r.errorMsg}",
              colorText: Colors.white,
              titleText: Center(
                  child: Text("Error",
                      style: Get.textTheme.headline6.copyWith(
                        color: Colors.white,
                      ))),
              messageText: Center(
                child: Text("${r.errorMsg}",
                    style: Get.textTheme.headline6
                        .copyWith(color: Colors.white, fontSize: 16)),
              ),
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red);
        }
      });
    } else {}
    update();
    // Get.toNamed();
  }

  goToVerficiationCode(String verType) {
    Get.to(VerificationCode(verType));
  }

  getVerificationCode(String verType) async {
    try {
      String value = controller1.text +
          controller2.text +
          controller3.text +
          controller4.text +
          controller5.text +
          controller6.text;
      if (value.length == 6) {
        var data;
        otp = int.parse(value);
        if (verType == "phone") {
          data = await checkOtpByPhoneUseCase(
              CheckPhoneOtpModel(countryCode, phoneNumber, otp));
        } else {
          data =
              await checkOtpByEmailUseCase(CheckEmailOptModel(otp, userEmail));
        }

        data.fold((l) {
          debugPrint("THe error is as: $l");
        }, (r) {
          debugPrint("THe data is as ${r.success}");
          if (true == r.success) {
            Get.snackbar("Success", "Verification SuccessFull",
                snackPosition: SnackPosition.BOTTOM);
            Get.toNamed(ResetPassword.routeName);
          } else {
            Get.snackbar("Error", "${r.errorMsg}",
                colorText: Colors.white,
                titleText: Center(
                    child: Text("Error",
                        style: Get.textTheme.headline6.copyWith(
                          color: Colors.white,
                        ))),
                messageText: Center(
                  child: Text("${r.errorMsg}",
                      style: Get.textTheme.headline6
                          .copyWith(color: Colors.white, fontSize: 16)),
                ),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red);
          }
        });
      } else {
        Get.snackbar("Error", "Please fill all the fields!",
            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      }
    } on Exception {
      Get.snackbar("Error", "Please only enter number!",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
    update();
  }
}
