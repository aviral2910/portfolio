import 'package:flutter/material.dart';

class ProjectUpSliderProvider extends ChangeNotifier {
  bool _isSliderUp = false;

  bool get getSlider => _isSliderUp;

  set setSlider(bool isSlider) {
    _isSliderUp = isSlider;
    notifyListeners();
  }
}
