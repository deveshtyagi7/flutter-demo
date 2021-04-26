import 'package:flutter/material.dart';
import 'package:parkingbud/presentation/theme/palette.dart';

class BodyButton extends StatelessWidget {
  final Function navigatePage;
  final String text;
  const BodyButton({@required this.navigatePage, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0XFFEA5882).withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(1, 3),
          ),
        ],
        gradient: LinearGradient(
          colors: [
            Palette.accentColor,
            Color(0XFFEA5882),
          ],
          begin: FractionalOffset.centerLeft,
        ),
      ),
      child: TextButton(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "ProximaNova",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onPressed: () {
          navigatePage(context);
        },
      ),
    );
  }
}
