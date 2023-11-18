import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      errorBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      prefixIconColor: Colors.black,
      suffixIconColor:  Colors.black,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          fixedSize: Size(300, 50),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          foregroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 18)),
    ));

OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
  color: Colors.grey,
));
