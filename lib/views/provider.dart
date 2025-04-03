import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;
  Color _selectedColor = Colors.blue;
  double _fontSize = 16.0;

  bool get isDarkMode => _isDarkMode;
  Color get selectedColor => _selectedColor;
  double get fontSize => _fontSize;

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }

  void changeColor(Color color) {
    _selectedColor = color;
    notifyListeners();
  }

  void changeFontSize(double size) {
    _fontSize = size;
    notifyListeners();
  }
}