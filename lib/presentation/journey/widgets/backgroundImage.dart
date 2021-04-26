import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      child: Image.asset(
        "assets/images/map/Group 23557@2x.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
