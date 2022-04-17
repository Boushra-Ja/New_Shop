import 'package:flutter/material.dart';

class Themes {
  static const color = Color(0xFFAF3A88);
  static const borderColor = Colors.black;


  static const headline1 = TextStyle(fontSize: 18);
  static const headline2 = TextStyle(
      decoration: TextDecoration.underline, color: color, fontSize: 18);
  static const headline3 = TextStyle(fontSize: 20);
  static const subtitle1 = TextStyle(fontSize: 14);
  static const subtitle2 = TextStyle(fontSize: 14 , color: Colors.grey);
  static const bodyText1 = TextStyle(fontSize: 16 , color: Colors.black);
  static const bodyText2 = TextStyle(fontSize: 16 , color: color);


  //static ThemeData customDarkTheme = ThemeData.dark().copyWith();

  //static ThemeData customLightTheme = ThemeData.light().copyWith();
}
