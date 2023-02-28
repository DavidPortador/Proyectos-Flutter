import 'package:flutter/material.dart';
import 'package:socialtec/themes/constants.dart';

// Los customs se aplicaran en ambos temas
ThemeData customs = ThemeData(
  hintColor: Colors.black87,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black87,
    ),
  ),
  primaryColor: const Color(0xFF1E1E2C),
  scaffoldBackgroundColor: const Color(0xFF2D2D44),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      primary: kPrimaryColor,
      shape: const StadiumBorder(),
      maximumSize: const Size(double.infinity, 56),
      minimumSize: const Size(double.infinity, 56),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: kPrimaryLightColor,
    iconColor: kPrimaryColor,
    prefixIconColor: kPrimaryColor,
    contentPadding: EdgeInsets.symmetric(
        horizontal: defaultPadding, vertical: defaultPadding),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      borderSide: BorderSide.none,
    ),
  ),
);

ThemeData lightTheme = ThemeData.lerp(customs, ThemeData.light(), 0);

ThemeData darkTheme = ThemeData.lerp(customs, ThemeData.dark(), 0);

ThemeData pinkTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFFF49FB6),
  scaffoldBackgroundColor: const Color(0xFFFAF8F0),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF24737c),
    backgroundColor: Color(0xFFA6E0DE),
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Colors.black87,
    ),
  )
);

ThemeData halloweenTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFF55705A),
  scaffoldBackgroundColor: const Color(0xFFE48873),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFFea8e71),
    backgroundColor: Color(0xFF2b2119),
  ),
);

ThemeData darkBlueTheme = darkTheme.copyWith(
  primaryColor: const Color(0xFF1E1E2C),
  scaffoldBackgroundColor: const Color(0xFF2D2D44),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      color: Color(0xFF33E1Ed),
    ),
  ),
);

