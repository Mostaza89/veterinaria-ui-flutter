import 'package:flutter/material.dart';

class ThemeProvider extends ValueNotifier<ThemeMode> {
  ThemeProvider(super.value);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

final themeProvider = ThemeProvider(ThemeMode.light);
