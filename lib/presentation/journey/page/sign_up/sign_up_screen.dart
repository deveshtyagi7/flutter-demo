import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:parkingbud/presentation/journey/controller/sign_up_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/custom_appbar_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/main_body_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';
import 'package:parkingbud/di/get_it.dart' as getIt;

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signUpScreen';
  final SignUpController signUpController = Get.put(getIt.getItInstance());
  @override
  Widget build(BuildContext context) {
    return
        //  WillPopScope(
        //   onWillPop: () async {
        //     bool value = false;
        //     await Get.defaultDialog(
        //       title: "Do you want to exit?",

        //       onCancel: () {
        //         value = false;
        //       },
        //       barrierDismissible: false,
        //       onConfirm: () {
        //         value = true;
        //       },
        //     );

        //     return value;
        //   },
        //   child:
        Scaffold(
            resizeToAvoidBottomInset: false,
            body: MainBodyWidget(
              child: buildBodyWidget(),
            )
            // ),
            );
  }

  Widget buildBodyWidget() {
    return Container(
      child: ListView(
        children: [
          CustomAppBar(),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text("Sign up", style: Get.textTheme.headline5),
              Text("Let's find and book your nearest parking space"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          buildSignUpForm(),
        ],
      ),
    );
  }

  Widget buildSignUpForm() {
    return GetBuilder<SignUpController>(
      builder: (signUpController) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: signUpController.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "First Name",
                style: Get.textTheme.headline6,
              ),
              TextFormField(
                  controller: signUpController.firstNameController,
                  cursorColor: kDarkBlack.withOpacity(0.1),
                  validator: (value) =>
                      signUpController.firstNameValidator(value),
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Last Name",
                style: Get.textTheme.headline6,
              ),
              TextFormField(
                  controller: signUpController.lastNameController,
                  validator: (value) =>
                      signUpController.lastNameValidator(value),
                  cursorColor: kDarkBlack.withOpacity(0.1),
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  )),
              SizedBox(height: 20),
              Text(
                "Email",
                style: Get.textTheme.headline6,
              ),
              TextFormField(
                  controller: signUpController.emailController,
                  validator: (value) => signUpController.emailValidator(value),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: kDarkBlack.withOpacity(0.1),
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  )),
              SizedBox(height: 20),
              Text(
                "Phone Number",
                style: Get.textTheme.headline6,
              ),
              Row(
                children: [
                  CountryCodePicker(
                    onChanged: (value) {
                      String convalue = value.toString().replaceAll("+", "");
                      debugPrint("THe value is as: $convalue");
                      signUpController.countryCode = convalue;
                    },
                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                    initialSelection: 'US',

                    // flag can be styled with BoxDecoration's `borderRadius` and `shape` fields
                    flagDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                        controller: signUpController.phoneNumberController,
                        validator: (value) =>
                            signUpController.phoneNumberValidator(value),
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                        cursorColor: kDarkBlack.withOpacity(0.1),
                        decoration: InputDecoration(
                          fillColor: Colors.green,
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: kDarkBlack.withOpacity(0.2), width: 5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: kDarkBlack.withOpacity(0.2), width: 5),
                          ),
                          border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: kDarkBlack.withOpacity(0.2), width: 5),
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        )),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Password",
                style: Get.textTheme.headline6,
              ),
              TextFormField(
                  controller: signUpController.passwordController,
                  obscureText: signUpController.hidePassword,
                  validator: (value) {
                    return signUpController.passwordValidator(value);
                  },
                  cursorColor: kDarkBlack.withOpacity(0.1),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          signUpController.hidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kDarkBlue,
                        ),
                        onPressed: () {
                          signUpController.hideUnhidePassword();
                        }),
                    fillColor: Colors.green,
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  )),
              SizedBox(height: 10),
              Text(
                "Confirm Password",
                style: Get.textTheme.headline6,
              ),
              TextFormField(
                  controller: signUpController.confirmPasswordController,
                  obscureText: signUpController.hideConfirmPassword,
                  validator: (value) =>
                      signUpController.confirmPasswordValidator(value),
                  cursorColor: kDarkBlack.withOpacity(0.1),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(
                          signUpController.hideConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: kDarkBlue,
                        ),
                        onPressed: () {
                          signUpController.hideUnhideConfirmPassword();
                        }),
                    fillColor: Colors.green,
                    enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: kDarkBlack.withOpacity(0.2), width: 5),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                  )),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                      value: signUpController.agreeTS,
                      onChanged: (bool value) {
                        signUpController.changeTS(value);
                      }),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Agree ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Terms of Use",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: kDarkBlue,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " and ", style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: "Privary policy",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: kDarkBlue,
                              fontWeight: FontWeight.bold))
                    ]),
                  ),
                ],
              ),
              Text(
                "${signUpController.tsError}",
                style: TextStyle(color: Colors.red),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  signUpController.proccedSignUp();
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    gradient: gradient6,
                  ),
                  child: Center(
                    child: Text("Sign Up",
                        style: Get.textTheme.headline6
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
                  TextButton(
                      onPressed: signUpController.navigateToSignIn,
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 17,
                            decoration: TextDecoration.underline,
                            decorationColor: kDarkBlue,
                            decorationThickness: 4,
                            color: kDarkBlue,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
