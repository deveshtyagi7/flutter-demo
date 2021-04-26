import 'dart:io';

import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'package:flutter/material.dart';
import 'package:parkingbud/data/models/request/loginUserEmailModel.dart';
import 'package:parkingbud/domain/usecase/loginByEmailUseCase.dart';
import 'package:parkingbud/presentation/journey/page/forget_password/forgetPassword.dart';

class EmailSignInController extends GetxController {
  final LoginByEmailUseCase loginByEmailUseCase;
  bool hidePassword = true;
  bool agreeTS = false;
  String tsError = "";

  TextEditingController passwordController;
  TextEditingController emailController;
  GlobalKey<FormState> formKey;

  EmailSignInController(this.loginByEmailUseCase);
  @override
  onInit() {
    passwordController = TextEditingController();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.onInit();
  }

  Future checkBiometrics() async {
    bool isAuthenticated = false;
    try {
      List<BiometricType> availableBiometrics =
          await LocalAuthentication().getAvailableBiometrics();
      bool isFace = availableBiometrics.contains(BiometricType.face);
      if (isFace && Platform.isIOS) {
        isAuthenticated = await LocalAuthentication().authenticate(
          biometricOnly: true,
          useErrorDialogs: true,
          localizedReason: "Please authenticate to sign in.",
        );
      }
    } on Exception {}
  }

  changeTS(bool value) {
    agreeTS = value;
    update();
  }

  emailValidator(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return '⚠ Please enter a valid email!';
    }
    return null;
  }

  hideUnhidePassword() {
    hidePassword = !hidePassword;
    update();
  }

  passwordValidator(String value) {
    if (value.trim() == "") {
      return "⚠ Please enter a valid\npassword!";
    } else if (value.trim().length < 8) {
      return "⚠ Password must be eight\n characters long!";
// ['!','@','#','$','%','^','&','*']
    } else if (!RegExp(r"^[ A-Za-z0-9!@#$*&^]*$").hasMatch(value)) {
      return "⚠ Please only add character\n fixed characters!";
    } else if (!RegExp(r'[!@$#&^]').hasMatch(value) ||
        !RegExp(r'[0-9]').hasMatch(value)) {
      return "⚠ Password must have a \nspecial character and\n number!";
    }
    return null;
  }

  proceedSignIn() async {
    if (formKey.currentState.validate() && agreeTS == true) {
      tsError = "";
      var data = await loginByEmailUseCase(
          LoginUserEmailModel(emailController.text, passwordController.text));
      data.fold((l) {
        debugPrint("THe error is as: $l");
      }, (r) {
        debugPrint("THe data is as ${r.success}");
        if (true == r.success) {
          Get.snackbar("Success", "Login SuccessFull");
          // navigateToSignIn();
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
      if (!agreeTS) {
        tsError = "⚠ Cannot Signup without agreeing Terms and Condition";
      } else {
        tsError = "";
      }
    }
    update();
  }

  goToForgetPassword() {
    Get.toNamed(ForgetPassword.routeName);
  }
}
