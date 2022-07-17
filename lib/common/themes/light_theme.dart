import 'package:flutter/material.dart';

const kRed = Color(0xFFEA2D44);
const kBlue = Color(0xFF3FBBC4);
const kLightBlue = Color(0xFFD7EDEC);
const kYellow = Color(0xFFFFD527);
const kGreen = Color(0xFFC1E24B);
const kOrange = Color(0xFFED9224);
const kGray = Color(0xFF8A8A8A);
const kWhite = Colors.white;

final ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(backgroundColor: kBlue),
  primaryColor: Colors.white,
  scaffoldBackgroundColor: kLightBlue,

  // appBarTheme: AppBarTheme(color: Colors.white),
  primaryTextTheme: const TextTheme(
    headline6: TextStyle(
      color: kGray,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyText1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: kGray,
    ),
    headline5: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: kGray,
    ),
  ),
);
