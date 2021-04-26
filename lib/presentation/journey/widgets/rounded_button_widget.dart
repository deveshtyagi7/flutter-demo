import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Gradient gradient;
  final String title;
  final Function onPressed;
  final IconData iconData;
  final TextStyle textStyle;
  final Color iconColor;
  const RoundedButton({
    Key key,
    this.gradient,
    this.title,
    this.onPressed,
    this.iconData,
    this.textStyle,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 8,
        shadowColor: Colors.black54,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: gradient,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(iconData, color: iconColor),
                Spacer(),
                Text(title, style: textStyle),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
