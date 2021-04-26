import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:parkingbud/data/models/request/getEmailOtpModel.dart';
import 'package:parkingbud/domain/usecase/loginBySociaMediaUseCase.dart';
import 'package:parkingbud/presentation/journey/page/sign_in/email_sign_in_screen.dart';
import 'dart:convert';

import 'package:parkingbud/presentation/journey/page/sign_up/sign_up_screen.dart';

class SignInController extends GetxController {
  final LoginBySocialMediaUseCase loginBySocialMediaUseCase;
  final GlobalKey<FormState> emailKey = GlobalKey();
  TextEditingController emailController;
  String socialMediaEmail = "";

  SignInController(this.loginBySocialMediaUseCase);
  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  //LOGIN WITH GOOGLE
  Future signInByGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
      googleSignIn.signOut();
      await googleSignIn.signIn().then((GoogleSignInAccount acc) async {
        socialMediaEmail = acc.email;
      });
      proceedSignInBySocialmedia();
    } on Exception {
      Get.snackbar("Error", "Something Went wrong please try again later!",
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
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

  void signInByFacebook() async {
    try {
      final facebookSignIn = FacebookLogin();
      facebookSignIn.logOut();
      final result = await facebookSignIn.logIn(['email']);
      debugPrint("THe status is as: ${result.errorMessage}");
      switch (result.status) {
        case FacebookLoginStatus.loggedIn:
          final token = result.accessToken.token;
          final graphResponse = await http.get(Uri.parse(
              "https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}"));
          final profile = json.decode(graphResponse.body);
          debugPrint("The profiel is as: $profile");
          if (profile["email"] != null || profile["email"] != "") {
            socialMediaEmail = profile["email"];
            proceedSignInBySocialmedia();
          } else {
            Get.snackbar(
                "Error", "This facebook account is not connected with email",
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.BOTTOM);
          }
          break;
        case FacebookLoginStatus.cancelledByUser:
          Get.snackbar("Error", "Operation not complete, Please try again!",
              backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
          break;
        case FacebookLoginStatus.error:
          Get.snackbar("Error", "Something Went wrong please try again later!",
              backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
          break;
      }
    } on Exception {
      Get.snackbar("Error", "Something Went wrong please try again later!",
          backgroundColor: Colors.red, snackPosition: SnackPosition.BOTTOM);
    }
    update();
  }

  emailMeTheLink() {
    try {
      if (emailKey.currentState.validate()) {}
    } on Exception {}
  }

  proceedSignInBySocialmedia() async {
    var data =
        await loginBySocialMediaUseCase(GetEmailOtpModel(socialMediaEmail));
    data.fold((l) {
      debugPrint("THe error is as: $l");
    }, (r) {
      debugPrint("THe data is as ${r.success}");
      if (true == r.success) {
        Get.snackbar("Success", "Login SuccessFull",
            snackPosition: SnackPosition.BOTTOM);
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
  }

  navigateToSignUp() {
    Get.offAndToNamed(SignUpScreen.routeName);
    // Get.toNamed(SignUpScreen.routeName);
  }

  navigateToPasswordSignIn() {
    Get.toNamed(EmailSignInScreen.routeName);
  }
}
