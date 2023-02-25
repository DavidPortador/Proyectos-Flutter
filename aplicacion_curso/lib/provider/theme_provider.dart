import 'package:aplicacion_curso/settings/style_settings.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeData? _themeData = StyleSettings.darkTheme();

  getThemeData() => this._themeData;
  setThemeData(ThemeData theme) {
    this._themeData = theme;
    notifyListeners();
  }
}
