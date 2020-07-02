import 'package:flutter/material.dart';

const primaryColor = Color(0xFFB43222);
const accentColor = Color(0xFF1053B5);
const textColor = Colors.black;
const colorDark = Colors.black;


ThemeData theme = ThemeData(
  appBarTheme: AppBarTheme(
    color: primaryColor,
    elevation: 1,
  ),

  primaryColor: primaryColor,
  accentColor: accentColor,
  primaryColorDark: colorDark,

  textTheme: TextTheme(
    bodyText1: TextStyle(color: textColor, fontWeight: FontWeight.normal),
    button: TextStyle(color: primaryColor ,fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),

  ),

);