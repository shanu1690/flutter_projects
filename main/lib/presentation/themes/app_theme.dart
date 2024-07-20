import 'package:flutter/material.dart';

class AppTheme {

  static ThemeMode themeMode=ThemeMode.system;

  toggleTheme(){
    themeMode=themeMode==ThemeMode.light?ThemeMode.dark:ThemeMode.light;
  }
}