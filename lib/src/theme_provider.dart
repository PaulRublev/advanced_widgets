import 'package:flutter/material.dart';

import 'custom_themes_data.dart';

class ThemeProvider with ChangeNotifier {
  Themes _theme = Themes.dark;
  ThemeData themeData = ThemeData.dark();

  ThemeData currentTheme() {
    return CustomThemesData.getThemeData(_theme);
  }

  void switchTheme({Themes? theme}) {
    const themesList = Themes.values;
    _theme = theme ?? themesList[_getNextIndex(themesList)];
    themeData = currentTheme();
    notifyListeners();
  }

  int _getNextIndex(List<Themes> themesList) {
    var index = themesList.indexOf(_theme);
    return index == themesList.length - 1 ? 0 : ++index;
  }
}
