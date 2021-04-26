import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:parkingbud/data/models/request/resetPasswordEmail.dart';
import 'package:parkingbud/data/models/request/resetPasswordPhone.dart';
import 'package:parkingbud/domain/usecase/resetPasswordByEmailUseCase.dart';
import 'package:parkingbud/domain/usecase/resetPasswordByPhoneUseCase.dart';
import 'package:parkingbud/presentation/journey/controller/verification_controller.dart';
import 'package:parkingbud/presentation/journey/page/reset_password/passwordResetSuccessful.dart';
import 'package:parkingbud/presentation/journey/page/sign_in/sign_in_screen.dart';

class ResetPasswordController extends GetxController {
  final ResetPasswordByEmailUseCase resetPasswordByEmailUseCase;
  final ResetPasswordByPhoneUseCase resetPasswordByPhoneUseCase;
  bool hidePassword = true;
  bool hideConfirmPassword = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final VerificationController verificationController = Get.find();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  ResetPasswordController(
      this.resetPasswordByEmailUseCase, this.resetPasswordByPhoneUseCase);

  hideUnhidePassword() {
    hidePassword = !hidePassword;
    update();
  }

  hideUnhideConfirmPassword() {
    hideConfirmPassword = !hideConfirmPassword;
    update();
  }

  passwordValidator(String value) {
    if (value.trim() == null) {
      return "⚠ Please enter valid password!";
    } else if (value.trim().length < 8) {
      return "⚠ Password must be eight characters long!";
// ['!','@','#','$','%','^','&','*']
    } else if (!RegExp(r"^(?=.*?[A-Z])").hasMatch(value)) {
      return "Password must have a uppercase word";
    } else if (!RegExp(r"^[ A-Za-z0-9!@#$*&^]*$").hasMatch(value)) {
      return "⚠ Please only add \" ! @ # \$ % ^ & * \" as symbols !";
    } else if (!RegExp(r'[!@$#&^]').hasMatch(value) ||
        !RegExp(r'[0-9]').hasMatch(value)) {
      return "⚠ Password must have a special character and number!";
    }
    return null;
  }

  passwordReset() async {
    if (formKey.currentState.validate()) {
      var data;
      if (verificationController.verificationType == "email") {
        data = await resetPasswordByEmailUseCase(ResetPasswordEmailModel(
            verificationController.otp,
            verificationController.userEmail,
            newPasswordController.text,
            confirmNewPasswordController.text));
      } else {
        debugPrint("The is phone");
        debugPrint(
            "THe otp is as ${verificationController.otp} ${verificationController.countryCode} ${verificationController.phoneNumber}");
        data = await resetPasswordByPhoneUseCase(ResetPasswordPhoneModel(
            verificationController.otp,
            verificationController.countryCode,
            verificationController.phoneNumber,
            newPasswordController.text,
            confirmNewPasswordController.text));
      }
      data.fold((l) {
        debugPrint("THe error is as: $l");
      }, (r) {
        debugPrint("THe data is as ${r.success}");
        if (true == r.success) {
          Get.offAndToNamed(SuccessfulPasswordReset.routeName);
          Get.snackbar("Success", "Password Change SuccessFull",
              snackPosition: SnackPosition.BOTTOM);
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
  }

  confirmPasswordValidator(String value) {
    if (value != newPasswordController.text) {
      return "⚠ Password does not match";
    }
    return null;
  }
}
