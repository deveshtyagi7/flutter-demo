import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parkingbud/presentation/journey/controller/reset_password_controller.dart';
import 'package:parkingbud/presentation/journey/widgets/backgroundImage.dart';
import 'package:parkingbud/presentation/journey/widgets/body.dart';
import 'package:parkingbud/presentation/journey/widgets/bodyButton.dart';
import 'package:parkingbud/presentation/journey/widgets/custom_appbar_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/main_body_widget.dart';
import 'package:parkingbud/presentation/journey/widgets/passwordFieldWidget.dart';
import 'package:parkingbud/presentation/journey/widgets/text_button_widget.dart';
import 'package:parkingbud/presentation/theme/colors.dart';
import '../../../theme/palette.dart';
import 'package:parkingbud/di/get_it.dart' as getIt;

class ResetPassword extends StatelessWidget {
  final getItInstance = getIt.getItInstance;
  final ResetPasswordController resetPasswordController =
      Get.put(getIt.getItInstance());
  static const routeName = '/resetPassword';

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
          resizeToAvoidBottomInset: false,
          body: MainBodyWidget(
            child: buildBodyWidget(),
          ),
        ),
      ),
    );
  }

  Container buildBodyWidget() {
    return Container(
      child: ListView(
        children: [
          CustomAppBar(
            image: AssetImage(
                "assets/images/forgot-reset-password/reset password.png"),
            height: 80,
          ),
          Column(
            children: [
              SizedBox(height: 30),
              GetBuilder<ResetPasswordController>(
                  builder: (resetPasswordController) {
                return buildFormField();
              }),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButtonWidget(
                  gradient: gradient6,
                  onPressed: () {
                    resetPasswordController.passwordReset();
                  },
                  text: "Change Password",
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFormField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: resetPasswordController.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New password",
              style: Get.textTheme.headline6,
            ),
            PasswordFieldWidget(
              iconOnPressed: () => resetPasswordController.hideUnhidePassword(),
              textEditingController:
                  resetPasswordController.newPasswordController,
              obsecureText: resetPasswordController.hidePassword,
              validator: (value) =>
                  resetPasswordController.passwordValidator(value),
            ),
            SizedBox(height: 20),
            Text(
              "Re-Enter new password",
              style: Get.textTheme.headline6,
            ),
            PasswordFieldWidget(
              iconOnPressed: () =>
                  resetPasswordController.hideUnhideConfirmPassword(),
              textEditingController:
                  resetPasswordController.confirmNewPasswordController,
              obsecureText: resetPasswordController.hideConfirmPassword,
              validator: (value) =>
                  resetPasswordController.confirmPasswordValidator(value),
            ),
          ],
        ),
      ),
    );
  }
}
