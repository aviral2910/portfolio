import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color _themeColor = const Color.fromRGBO(27, 182, 252, .85);

  Color get getThemeColor => _themeColor;

  setThemeColor(Color themeColor) {
    _themeColor = themeColor;
    notifyListeners();
  }
}
