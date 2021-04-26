import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/controller/verification_controller.dart';
import 'package:parkingbud/presentation/journey/page/verfication/verification_code.dart';
import 'package:parkingbud/presentation/journey/widgets/raised_gradient_button.dart';
import 'package:parkingbud/presentation/journey/widgets/text_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';

import 'package:parkingbud/di/get_it.dart' as getIt;

class VerificationSent extends StatelessWidget {
  final VerificationController verificationController = Get.find();
  static const routeName = '/verificationSent';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 450,
              width: 346,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.24),
                    offset: Offset(4, 4),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 165,
                    width: 165,
                    child: Image.asset(
                      'assets/images/pop-up-screen-assets/Email_notification.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'A verification Link has been sent \n   to your email account!',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF233874),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'To continue booking, please verify your\naccount by clicking the link that has\njust been sent to your email address.',
                    style: TextStyle(
                      color: Color(0xFF909090),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 49,
                          width: 160,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Material(
                              elevation: 10,
                              child: TextButtonWidget(
                                  gradient: LinearGradient(
                                      colors: [Colors.white, Colors.white]),
                                  text: 'Start Exploring!',
                                  textStyle: Get.textTheme.headline5
                                      .copyWith(color: kDarkBlue),
                                  onPressed: () {
                                    verificationController
                                        .goToVerficiationCode("email");
                                  }),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13,
                        ),
                        RaisedGradientButton(
                          child: Text(
                            'Open Email',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFFEA5882),
                              Color(0xFF592392),
                            ],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                          ),
                          onPressed: () {
                            //TODO: OPEN GMAIL
                          },
                          width: 153,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
