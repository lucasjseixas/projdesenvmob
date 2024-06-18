import 'package:flutter/material.dart';
import 'package:projec1/utils/themewidget/theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool isDarkMode = false;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
      isDarkMode = true;
    } else {
      themeData = lightMode;
      isDarkMode = false;
    }
    notifyListeners();
  }
}
