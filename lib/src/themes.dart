import 'package:flutter/material.dart';

enum Themes {
  light,
  dark,
  grey,
  green,
  yellow,
}

abstract class CustomThemesData {
  static ThemeData getThemeData(Themes theme) {
    switch (theme) {
      case Themes.light:
        return ThemeData.light();
      case Themes.dark:
        return ThemeData.dark();
      case Themes.grey:
        return ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.grey,
          ),
        );
      case Themes.green:
        return ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ),
        );
      case Themes.yellow:
        return ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.yellow,
          ),
        );
    }
  }
}
