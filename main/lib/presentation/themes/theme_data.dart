// Configuring Light Theme
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  primaryColor: Colors.redAccent,
  scaffoldBackgroundColor: Colors.greenAccent,
  appBarTheme: const AppBarTheme(
    color: Colors.redAccent,
  ),
  bottomNavigationBarTheme:
      const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
      selectedItemColor: Colors.black
      ),
);

final ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black26,
  scaffoldBackgroundColor: Colors.black87,
  appBarTheme: const AppBarTheme(
    color: Colors.black26,
    titleTextStyle: TextStyle(
      color: Colors.white,
    ),
  ),
   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black38,
      selectedItemColor: Colors.white
     ),
);
