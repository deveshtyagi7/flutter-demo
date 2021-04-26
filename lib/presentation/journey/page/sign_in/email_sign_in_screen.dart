import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/controller/email_sign_in_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/custom_appbar_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/main_body_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/rounded_button_image_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';
import 'package:parkingbud/di/get_it.dart' as getIt;

class EmailSignInScreen extends StatelessWidget {
  static const routeName = '/emailSignInScreen';
  final getItInstance = getIt.getItInstance;
  final EmailSignInController emailSignInController =
      Get.put(getIt.getItInstance());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainBodyWidget(
        child: buildBodyWidget(),
      ),
    );
  }

  Container buildBodyWidget() {
    return Container(
      child: ListView(
        children: [
          CustomAppBar(),
          SizedBox(height: 30),
          Column(
            children: [
              Text("Sign In", style: Get.textTheme.headline5),
              Text("Let's find and book your nearest parking space"),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          buildTextField(),
          SizedBox(height: 40),
          buildSignInWidgets(),
          SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: buildAgreeTSWidget())
        ],
      ),
    );
  }

  Widget buildTextField() {
    return GetBuilder<EmailSignInController>(
        builder: (signUpController) => Form(
              key: signUpController.formKey,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: Get.textTheme.headline6
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                            controller: emailSignInController.emailController,
                            validator: (value) =>
                                emailSignInController.emailValidator(value),
                            cursorColor: kDarkBlack.withOpacity(0.1),
                            decoration: InputDecoration(
                              hintText: "i.e Email address or mobile number",
                              fillColor: Colors.green,
                              enabledBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kDarkBlack.withOpacity(0.2),
                                    width: 5),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kDarkBlack.withOpacity(0.2),
                                    width: 5),
                              ),
                              border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: kDarkBlack.withOpacity(0.2),
                                    width: 5),
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 15.0),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: Get.textTheme.headline6
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                  controller:
                                      emailSignInController.passwordController,
                                  obscureText:
                                      emailSignInController.hidePassword,
                                  validator: (value) => emailSignInController
                                      .passwordValidator(value),
                                  cursorColor: kDarkBlack.withOpacity(0.1),
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          emailSignInController.hidePassword
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: kDarkBlue,
                                        ),
                                        onPressed: () {
                                          emailSignInController
                                              .hideUnhidePassword();
                                        }),
                                    fillColor: Colors.green,
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: kDarkBlack.withOpacity(0.2),
                                          width: 5),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: kDarkBlack.withOpacity(0.2),
                                          width: 5),
                                    ),
                                    border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                          color: kDarkBlack.withOpacity(0.2),
                                          width: 5),
                                    ),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        15.0, 15.0, 15.0, 15.0),
                                  )),
                            ),
                            TextButton(
                                onPressed: () {
                                  emailSignInController.goToForgetPassword();
                                },
                                child: Text(
                                  "Forget Password",
                                  style: TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.underline,
                                      decorationColor: kDarkBlue,
                                      decorationThickness: 4,
                                      color: kDarkBlue,
                                      fontWeight: FontWeight.normal),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget buildSignInWidgets() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          RoundedImageButton(
            title: "Login Using Face ID",
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.white,
            ]),
            image: AssetImage(
              "assets/images/face-ID/Group 25419@2x.png",
            ),
            iconColor: kDarkBlue,
            onPressed: () async {
              // await emailSignInController.checkBiometrics();
            },
            textStyle: Get.textTheme.headline5.copyWith(color: kDarkBlue),
          ),
          SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              emailSignInController.proceedSignIn();
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: gradient6,
              ),
              child: Center(
                child: Text("Sign In",
                    style:
                        Get.textTheme.headline5.copyWith(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAgreeTSWidget() {
    return GetBuilder<EmailSignInController>(
      builder: (emailSignInController) => Column(
        children: [
          Row(
            children: [
              Checkbox(
                  value: emailSignInController.agreeTS,
                  onChanged: (bool value) {
                    emailSignInController.changeTS(value);
                  }),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: "Agree ", style: TextStyle(color: Colors.black)),
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
            "${emailSignInController.tsError}",
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
