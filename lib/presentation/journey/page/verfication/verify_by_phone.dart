import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/controller/verification_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/backgroundImage.dart';
import 'package:parkingbud/presentation/journey/widgets/body.dart';
import 'package:parkingbud/presentation/journey/widgets/bodyButton.dart';
import 'package:parkingbud/presentation/journey/widgets/text_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';
import '../reset_password/passwordReset.dart';
import '../../../theme/palette.dart';
import 'package:parkingbud/di/get_it.dart' as getIt;

class VerificationPhone extends StatelessWidget {
  static const routeName = '/verifyByPhone';
  final getItInstance = getIt.getItInstance;
  final VerificationController verificationController =
      Get.put(getIt.getItInstance());
  void navigatePage(BuildContext context) {
    Navigator.of(context).pushNamed(ResetPassword.routeName);
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Stack(children: [
            BackgroundImage(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListView(
                //   crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Body(
                    imageUrl:
                        "assets/images/forgot-reset-password/Password_Phone@2x.png",
                    title: "Forget Password?",
                    subtitle:
                        "Please enter your phone number,\nand we will send you a verification code.",
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Phone Number",
                    style: Get.textTheme.headline6,
                  ),
                  Form(
                    key: verificationController.phoneKey,
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (value) {
                            String convalue =
                                value.toString().replaceAll("+", "");
                            verificationController.countryCode =
                                int.parse(convalue);
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
                              controller:
                                  verificationController.phoneNumberController,
                              validator: (value) => verificationController
                                  .phoneNumberValidator(value),
                              keyboardType: TextInputType.number,
                              cursorColor: kDarkBlack.withOpacity(0.1),
                              maxLength: 10,
                              decoration: InputDecoration(
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
                                    EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  TextButtonWidget(
                      text: "Send",
                      gradient: gradient6,
                      onPressed: () {
                        verificationController.verificationType = "phone";
                        verificationController.navigateToVerifyCodeByPhone();
                      }),
                  SizedBox(height: 20),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  InputDecoration buildInputDecoration(String text) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(0),
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          width: 8,
          color: Color(0xFFD4DBE8),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Color(0xFFD4DBE8), width: 8),
      ),
      hintText: text,
      hintStyle: TextStyle(
        fontSize: 14,
        color: Palette.secondaryColor,
        fontFamily: 'ProximaNova',
      ),
    );
  }
}
