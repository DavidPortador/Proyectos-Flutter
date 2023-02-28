import 'package:flutter/material.dart';
import 'package:socialtec/themes/constants.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: kPrimaryColor,
  hintColor: Colors.deepPurple.shade300,
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
  primaryTextTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.black87),
    titleLarge: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.black87),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.black87),
  ),
  
  
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: kPrimaryColor,
  hintColor: Colors.deepPurple.shade300,
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
  primaryTextTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white70),
    titleLarge: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic, color: Colors.white70),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: Colors.white70),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(color: Colors.black87),
  ),
);

ThemeData pinkTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFFF49FB6),
  scaffoldBackgroundColor: Color.fromARGB(255, 221, 187, 196),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF24737c),
    backgroundColor: Color(0xFFA6E0DE),
  ),
  // primaryTextTheme: const TextTheme(
  //   bodyText1: TextStyle(
  //     color: Colors.black87,
  //   ),
  // ),
);

ThemeData halloweenTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFF55705A),
  scaffoldBackgroundColor: const Color(0xFFE48873),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFFea8e71),
    backgroundColor: Color(0xFF2b2119),
  ),
);

ThemeData darkBlueTheme = ThemeData.dark().copyWith(
  primaryColor: const Color(0xFF1E1E2C),
  scaffoldBackgroundColor: const Color(0xFF2D2D44),
  // textTheme: const TextTheme(
  //   bodyText1: TextStyle(
  //     color: Color(0xFF33E1Ed),
  //   ),
  // ),
);