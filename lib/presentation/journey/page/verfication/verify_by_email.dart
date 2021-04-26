import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:parkingbud/presentation/journey/controller/verification_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/backgroundImage.dart';
import 'package:parkingbud/presentation/journey/widgets/body.dart';
import 'package:parkingbud/presentation/journey/widgets/bodyButton.dart';
import 'package:parkingbud/presentation/journey/widgets/text_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';
import '../reset_password/passwordReset.dart';
import '../../../theme/palette.dart';
import 'package:parkingbud/di/get_it.dart' as getIt;

class VerificationEmail extends StatelessWidget {
  final getItInstance = getIt.getItInstance;
  final VerificationController verificationController =
      Get.put(getIt.getItInstance());
  static const routeName = '/verifyByEmail';

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
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Body(
                    imageUrl:
                        "assets/images/forgot-reset-password/Password Email@2x.png",
                    title: "Forget Password?",
                    subtitle:
                        "Please enter your email address,\nand we will send you a verification code.",
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Email",
                    style: Get.textTheme.headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  GetBuilder<VerificationController>(
                    builder: (verificationController) => Form(
                      key: verificationController.emailKey,
                      child: TextFormField(
                          controller: verificationController.emailController,
                          validator: (value) =>
                              verificationController.emailValidator(value),
                          cursorColor: kDarkBlack.withOpacity(0.1),
                          decoration: InputDecoration(
                            hintText: "i.e Email address or mobile number",
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
                                EdgeInsets.fromLTRB(10.0, 15.0, 15.0, 15.0),
                          )),
                    ),
                  ),
                  SizedBox(height: 40),
                  TextButtonWidget(
                    text: "Send",
                    textStyle:
                        Get.textTheme.headline5.copyWith(color: Colors.white),
                    onPressed: () {
                      verificationController.navigateToVerifyCodeByEmail();
                      verificationController.verificationType="email";
                    },
                    gradient: gradient6,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
