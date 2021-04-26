import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/page/sign_in/sign_in_screen.dart';
import 'package:parkingbud/presentation/journey/widgets/text_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';

class SuccessfulPasswordReset extends StatelessWidget {
  static const routeName = '/successResetPassword';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 165,
            width: 165,
            child: Image.asset(
              'assets/images/pop-up-screen-assets/Group 24511.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Your password was reset\nsucessfully!',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF233874),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'You can use your new password\nto login',
            style: TextStyle(color: Color(0xFF3B3B41), fontSize: 14),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButtonWidget(
              text: "Back To Login",
              gradient: gradient6,
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
                Get.back();
                Get.back();
                Get.back();
                // Get.toNamed(SignInScreen.routeName);
              },
            ),
          )
        ],
      ),
    );
  }
}
