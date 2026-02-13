import 'package:flutter/material.dart';
import 'package:islamiapp/Appcolors.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Appcolors.gold,
      type: BottomNavigationBarType.fixed,
    ),
  );
}
