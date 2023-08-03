import 'package:flutter/material.dart';

class SkillTypeProvider extends ChangeNotifier {
  String _selected = "Frameworks";

  String get selected => _selected;

  set setSelected(String selected) {
    _selected = selected;
    notifyListeners();
  }
}
