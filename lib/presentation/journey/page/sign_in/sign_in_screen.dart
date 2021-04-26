import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/controller/sign_in_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/custom_appbar_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/main_body_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/rounded_button_image_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/rounded_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';
import 'package:parkingbud/di/get_it.dart' as getIt;

class SignInScreen extends StatelessWidget {
  static const routeName = '/signInScreen';
  final getItInstance = getIt.getItInstance;
  final SignInController signInController = Get.put(getIt.getItInstance());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: MainBodyWidget(
          child: buildBodyWidget(),
        ));
  }

  Widget buildBodyWidget() {
    return Container(
      child: ListView(
        children: [
          CustomAppBar(),
          SizedBox(height: 10),
          Column(
            children: [
              Text("Sign In", style: Get.textTheme.headline5),
              Text("Choose how to sign in"),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: RoundedButton(
              title: "Sign In With Password",
              gradient: gradient6,
              iconData: Icons.mail,
              onPressed: signInController.navigateToPasswordSignIn,
              textStyle: Get.textTheme.headline5.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(child: Text("or")),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: signInController.emailKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: Get.textTheme.headline6
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                      controller: signInController.emailController,
                      validator: (value) =>
                          signInController.emailValidator(value),
                      cursorColor: kDarkBlack.withOpacity(0.1),
                      decoration: InputDecoration(
                        hintText: "i.e Email address",
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
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          buildSignInWidgets(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              TextButton(
                  onPressed: signInController.navigateToSignUp,
                  child: Text(
                    "Sign Up",
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
    );
  }

  Widget buildSignInWidgets() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          RoundedButton(
            title: "Email Me The Link",
            gradient: LinearGradient(colors: [Colors.white70, Colors.white70]),
            iconData: FeatherIcons.link,
            iconColor: kDarkBlue,
            onPressed: () {
              signInController.emailMeTheLink();
            },
            textStyle: Get.textTheme.headline5,
          ),
          SizedBox(height: 30),
          RoundedImageButton(
            title: "Continue With Facebook",
            gradient: gradient5,
            image: AssetImage(
                "assets/images/social-media-icons/Mask Group 6@2x.png"),
            iconColor: Colors.white,
            onPressed: () {
              signInController.signInByFacebook();
            },
            textStyle: Get.textTheme.headline5.copyWith(color: Colors.white),
          ),
          SizedBox(height: 30),
          RoundedImageButton(
            title: "Continue With Google",
            gradient: LinearGradient(colors: [Colors.white70, Colors.white70]),
            iconColor: kDarkBlue,
            onPressed: () async {
              await signInController.signInByGoogle();
            },
            image:
                AssetImage("assets/images/social-media-icons/Group 69@2x.png"),
            textStyle: Get.textTheme.headline5,
          ),
          SizedBox(height: 30),
          RoundedImageButton(
            title: "Continue With Apple",
            gradient: LinearGradient(colors: [Colors.black, Colors.black]),
            image: AssetImage(
                "assets/images/social-media-icons/Mask Group 113@2x.png"),
            iconColor: kDarkBlue,
            onPressed: () {},
            textStyle: Get.textTheme.headline5.copyWith(color: Colors.white),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
