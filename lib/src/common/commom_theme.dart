import 'package:flutter/material.dart';
import './common_colors.dart';

final themeData = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    visualDensity: VisualDensity.comfortable,
    textTheme: TextTheme(
      // Theme para Text();
      bodyText2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
        color: Color(0xFF41393E),
      ),
      // Theme para labels
      subtitle1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
      ),
      // Theme para Text() no butão;
      button:  TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 15.0,
      ),
    ),
    cardTheme: CardTheme(
      elevation: 4.0,
      color: backgroundLigther,
      shadowColor: Color(0xFFCCCCCC),
      margin: const EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    buttonTheme: ButtonThemeData(
      disabledColor: background,
      buttonColor: primary,
      textTheme: ButtonTextTheme.primary,
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0)
      ),
    ),
  );