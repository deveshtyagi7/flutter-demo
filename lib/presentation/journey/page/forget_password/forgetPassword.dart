import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/controller/forget_password_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/backgroundImage.dart';
import 'package:parkingbud/presentation/journey/widgets/body.dart';
import 'package:parkingbud/presentation/journey/widgets/text_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';
import '../../../theme/palette.dart';

import 'package:parkingbud/di/get_it.dart' as getIt;

class ForgetPassword extends StatelessWidget {
  final getItInstance = getIt.getItInstance;
  final ForgetPasswordController forgetPasswordController =
      Get.put(getIt.getItInstance());
  static const routeName = '/forgetPassword';
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          BackgroundImage(),
          GetBuilder<ForgetPasswordController>(
              builder: (forgetPasswordController) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ListView(
                      children: [
                        Body(
                          imageUrl:
                              "assets/images/forgot-reset-password/Forgot Password@2x.png",
                          title: "Forget Password?",
                          subtitle:
                              "How do you want to receive the code\nto reset your password?",
                        ),
                        SizedBox(height: 20),
                        Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio<VerifyThrough>(
                                  value: VerifyThrough.email,
                                  groupValue:
                                      forgetPasswordController.character,
                                  onChanged: (VerifyThrough value) {
                                    forgetPasswordController
                                        .changeCharacter(value);
                                  },
                                ),
                                Text(
                                  'Get a verification via email address',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "proximaNova",
                                      color:
                                          forgetPasswordController.character ==
                                                  VerifyThrough.email
                                              ? Palette.lightBlack
                                              : Palette.secondaryColor),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio<VerifyThrough>(
                                  value: VerifyThrough.phone,
                                  groupValue:
                                      forgetPasswordController.character,
                                  onChanged: (VerifyThrough value) {
                                    forgetPasswordController
                                        .changeCharacter(value);
                                  },
                                ),
                                Text(
                                  'Get a verification via phone number',
                                  style: TextStyle(
                                      fontFamily: "proximaNova",
                                      fontSize: 14,
                                      color:
                                          forgetPasswordController.character ==
                                                  VerifyThrough.phone
                                              ? Palette.lightBlack
                                              : Palette.secondaryColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        TextButtonWidget(
                          text: "Sign In",
                          textStyle: Get.textTheme.headline5
                              .copyWith(color: Colors.white),
                          onPressed: forgetPasswordController.navigatePage,
                          gradient: gradient6,
                        ),
                      ],
                    ),
                  ))
        ]),
      ),
    );
  }
}
