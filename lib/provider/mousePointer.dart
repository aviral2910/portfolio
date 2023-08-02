import 'package:flutter/material.dart';

class MousePointerProvider extends ChangeNotifier {
  double _mouseX = 0;
  double _mouseY = 0;

  double get getMouseX => _mouseX;
  double get getMouseY => _mouseY;

  setMousePointer(double x, double y) {
    _mouseX = x;

    _mouseY = y;
    notifyListeners();
  }
}
