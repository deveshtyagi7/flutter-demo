import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/controller/verification_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/custom_appbar_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/main_body_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/raised_gradient_button.dart';

import 'package:parkingbud/di/get_it.dart' as getIt;
import 'package:parkingbud/presentation/journey/widgets/text_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';

class VerificationCode extends StatelessWidget {
  final VerificationController verificationController = Get.find();
  final String verificationType;

  VerificationCode(this.verificationType);

  Widget buildOtpField(TextEditingController controller, BuildContext context,
          bool first, bool last) =>
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: TextField(
            controller: controller,
            autofocus: true,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            cursorColor: Colors.black,
            maxLength: 1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            onChanged: (value) {
              if (value.length == 1 && last == false) {
                FocusScope.of(context).nextFocus();
              }
              if (value.length == 0 && first == false) {
                FocusScope.of(context).previousFocus();
              }
            },
            showCursor: true,
            decoration: InputDecoration(
              counter: Offstage(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MainBodyWidget(child: buildMainWidget(context)),
    );
  }

  Container buildMainWidget(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          CustomAppBar(
            height: 80,
            image: AssetImage(verificationType == "email"
                ? "assets/images/forgot-reset-password/Otp Email.png"
                : "assets/images/forgot-reset-password/OTP Mobile.png"),
          ),
          SizedBox(height: 30),
          Column(
            children: [
              Text(
                'Verification Code',
                style: TextStyle(
                  fontSize: 19,
                  color: Color(0xFF233874),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                verificationType == "phone"
                    ? 'Enter the verification code that was just sent to\n your phone number'
                    : 'Enter the verification code that was just sent to\n your email address',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF909090),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          GetBuilder<VerificationController>(
              builder: (verificationController) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOtpField(verificationController.controller1, context,
                          true, false),
                      buildOtpField(verificationController.controller2, context,
                          false, false),
                      buildOtpField(verificationController.controller3, context,
                          false, false),
                      buildOtpField(verificationController.controller4, context,
                          false, false),
                      buildOtpField(verificationController.controller5, context,
                          false, false),
                      buildOtpField(verificationController.controller6, context,
                          false, true),
                    ],
                  )),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButtonWidget(
                text: "Verfiy",
                gradient: gradient6,
                onPressed: () {
                  verificationController.getVerificationCode(verificationType);
                }),
          ),
        ],
      ),
    );
  }
}
