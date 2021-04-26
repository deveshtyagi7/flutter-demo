import 'package:flutter/material.dart';
import 'package:parkingbud/presentation/theme/colors.dart';

class PasswordFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool obsecureText;
  final Function validator;
  final Function iconOnPressed;

  const PasswordFieldWidget(
      {Key key,
      this.textEditingController,
      this.obsecureText,
      this.validator,
      this.iconOnPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: textEditingController,
        autofocus: false,
        obscureText: obsecureText,
        validator: (value) => validator(value),
        cursorColor: kDarkBlack.withOpacity(0.1),
        decoration: InputDecoration(
          suffixIcon: IconButton(
              icon: Icon(
                obsecureText ? Icons.visibility : Icons.visibility_off,
                color: kDarkBlue,
              ),
              onPressed: () => iconOnPressed()),
          fillColor: Colors.green,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: kDarkBlack.withOpacity(0.2), width: 5),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: kDarkBlack.withOpacity(0.2), width: 5),
          ),
          border: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                BorderSide(color: kDarkBlack.withOpacity(0.2), width: 5),
          ),
          contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
        ));
  }
}
