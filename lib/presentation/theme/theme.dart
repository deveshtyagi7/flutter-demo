import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  AppTheme._();
  static final appTheme = AppTheme._();
  static final ThemeData kWhiteTheme = ThemeData(
      fontFamily: "Proxima Nova",
      accentColor: kDarkBlue,
      buttonTheme: ButtonThemeData(
          // buttonColor: kViolet,
          ),
      iconTheme: IconThemeData(color: kDarkBlue),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: kDarkBlue,
          fontWeight: FontWeight.w800,
        ),
        headline2: TextStyle(
          color: kDarkBlue,
          fontWeight: FontWeight.bold,
        ),
        headline3: TextStyle(
          color: kDarkBlue,
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          color: kDarkBlue,
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          color: kDarkBlue,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        headline6: TextStyle(color: kDarkBlue, fontWeight: FontWeight.w600),
      )
      // sliderTheme: SliderThemeData(
      //   activeTrackColor: kSliderColor,
      //   inactiveTrackColor: Color(0xffee2343),
      //   trackHeight: 4.0,
      //   thumbColor: kSliderColor,
      //   thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0),
      //   overlayColor: Colors.purple.withAlpha(92),
      //   overlayShape: RoundSliderOverlayShape(overlayRadius: 14.0),
      // ),
      );
}
