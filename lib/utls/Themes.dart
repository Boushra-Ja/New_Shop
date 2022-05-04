import 'package:flutter/material.dart';

class Themes {
  static const color = Color(0xFFAF3A88);
  static const color2 = Color(0xFFF5EFF3);
  static const borderColor = Colors.black;

  static const headline1 = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: 'Roboto');
  static const headline2 = TextStyle(
      decoration: TextDecoration.underline, color: color, fontSize: 18);
  static const headline4 =
  TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold);


  static const headline3 = TextStyle(fontSize: 20, color: Colors.black);
  static const headline5 = TextStyle(
      fontSize: 22, decoration: TextDecoration.underline, color: color);


  static const subtitle1 =
      TextStyle(fontSize: 14, color: Colors.black87, fontFamily: 'Roboto');
  static const subtitle2 = TextStyle(fontSize: 14, color: Colors.grey);
  static const subtitle3 = TextStyle(fontSize: 12, color: Colors.grey);

  static const bodyText1 = TextStyle(fontSize: 16, color: Colors.black);
  static const bodyText2 = TextStyle(fontSize: 16, color: color);
  static TextStyle bodyText3 =
      TextStyle(fontSize: 16, color: Colors.grey.shade600);
  static const bodyText4 = TextStyle(fontSize: 16, color: Colors.white);
  static TextStyle bodyText5 =
      TextStyle(fontSize: 16, color: Colors.grey.shade600);

//static ThemeData customDarkTheme = ThemeData.dark().copyWith();

//static ThemeData customLightTheme = ThemeData.light().copyWith();
}
