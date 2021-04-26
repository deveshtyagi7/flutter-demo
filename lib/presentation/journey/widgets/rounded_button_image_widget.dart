import 'package:flutter/material.dart';

class RoundedImageButton extends StatelessWidget {
  final Gradient gradient;
  final String title;
  final Function onPressed;
  final AssetImage image;
  // final IconData iconData;
  final TextStyle textStyle;
  final Color iconColor;
  const RoundedImageButton({
    Key key,
    this.gradient,
    this.title,
    this.onPressed,
    this.textStyle,
    this.iconColor = Colors.white,
    this.image,
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
                // Icon(iconData, color: iconColor),
                SizedBox(
                  width: 20,
                ),
                Image(
                  image: image,
                  height: 25,
                ),
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
