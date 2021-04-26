import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextButtonWidget extends StatelessWidget {
  final Function onPressed;
  final Gradient gradient;
  final String text;
  final TextStyle textStyle;

  const TextButtonWidget(
      {Key key, this.onPressed, this.gradient, this.text, this.textStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2), gradient: gradient),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text("$text",
              style: textStyle ??
                  Get.textTheme.headline6.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
