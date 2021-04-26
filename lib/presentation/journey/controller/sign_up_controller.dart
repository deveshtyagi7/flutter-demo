import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/data/models/request/signUpUserModel.dart';
import 'package:parkingbud/domain/usecase/signUpUserUseCase.dart';
import 'package:parkingbud/presentation/journey/page/sign_in/sign_in_screen.dart';

class SignUpController extends GetxController {
  final SignUpUser signUpUser;
  SignUpController(this.signUpUser);
  bool isLoading = false;
  GlobalKey<FormState> signUpFormKey = GlobalKey();

  //TEXT EDITING CONTROLLERS
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool hidePassword = true;
  bool hideConfirmPassword = true;
  bool agreeTS = false;
  String tsError = "";
  String countryCode = "1";
  //Values for API CALL
  //
  @override
  void onInit() {
    // firstNameController.text = "Name";
    // lastNameController.text = "Suresh";

    // emailController.text = "aatitkarki@gmail.com";
    // phoneNumberController.text = "3344343434";
    // passwordController.text = "Suresh11#";
    // confirmPasswordController.text = "Suresh11#";
    // debugPrint("The password is validated");
    super.onInit();
  }

  hideUnhidePassword() {
    hidePassword = !hidePassword;
    update();
  }

  hideUnhideConfirmPassword() {
    hideConfirmPassword = !hideConfirmPassword;
    update();
  }

  changeTS(bool value) {
    agreeTS = value;
    update();
  }

  firstNameValidator(String value) {
    debugPrint("The first name is $value");
    if (value.trim() == "") {
      return "⚠ First Name cannot be empty";
    } else if (value.contains(" ")) {
      return "⚠ Please do not add space in first name!";
    } else if (value.length > 100) {
      return "⚠ The first name cannot be more than 100 characters!";
    }
    return null;
  }

  lastNameValidator(String value) {
    if (value.trim() == "") {
      return "⚠ Last Name cannot be empty";
    } else if (value.contains(" ")) {
      return "⚠ Please do not add space in last name!";
    } else if (value.length > 100) {
      return "⚠ The last name cannot be more than 100 characters!";
    }
    return null;
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

  confirmPasswordValidator(String value) {
    if (value != passwordController.text) {
      return "⚠ Password does not match";
    }
    return null;
  }

  proccedSignUp() async {
    if (signUpFormKey.currentState.validate() && agreeTS == true) {
      tsError = "";
      phoneNumberController.text;
      SignUpUserModel signUpUserEntity = SignUpUserModel(
          phoneNumberController.text.trim(),
          firstNameController.text.trim(),
          lastNameController.text.trim(),
          emailController.text.trim(),
          countryCode,
          agreeTS,
          passwordController.text.trim(),
          confirmPasswordController.text.trim());
      var data = await signUpUser(signUpUserEntity);
      data.fold((l) {
        debugPrint("THe error is as: $l");
      }, (r) {
        debugPrint("THe data is as ${r.success}");
        if (r.success == true) {
          navigateToSignIn();
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
      debugPrint('Form is not validated');
      update();
    }
  }

  clearTextFields() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  navigateToSignIn() {
    // formKey.currentState.reset();
    Get.offAndToNamed(SignInScreen.routeName);
  }
}
