import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DarkThemeProvider extends ChangeNotifier {
  static const THEME_STATUS = "THEMESTATUS";
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    SharedPreferences.getInstance()
        .then((prefs) => prefs.setBool(THEME_STATUS, value));
    notifyListeners();
  }

  DarkThemeProvider() {
    _getDarkTheme();
  }

  void _getDarkTheme() {
    SharedPreferences.getInstance().then((prefs) {
      _darkTheme = prefs.getBool(THEME_STATUS) ?? false;
    });
  }
}
