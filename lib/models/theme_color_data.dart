import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeColorData with ChangeNotifier {
  final ThemeData indigoTheme = ThemeData(
      primaryColor: Colors.indigo[400],
      primarySwatch: Colors.indigo,
      accentColor: Colors.indigo[400],
      scaffoldBackgroundColor: Colors.indigo[400],
      appBarTheme: AppBarTheme(color: Colors.indigo[400]),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));
  final ThemeData amberTheme = ThemeData(
      primaryColor: Colors.amber[600],
      primarySwatch: Colors.amber,
      accentColor: Colors.amber[600],
      scaffoldBackgroundColor: Colors.amber[600],
      appBarTheme: AppBarTheme(color: Colors.amber[600]),
      textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white)));

  bool _isIndigo = true;
  static SharedPreferences _sharedPreferences;

  void switchTheme(bool selected) {
    _isIndigo = selected;
    setSharedPref(selected);
    notifyListeners();
  }

  ThemeData get selectedThemeData => _isIndigo ? indigoTheme : amberTheme;
  bool get isIndigo => _isIndigo;

  //SharedPreferences methods
  Future<void> createSharedPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void setSharedPref(bool value) {
    _sharedPreferences.setBool("themeData", value);
  }

  void getSharedPref() {
    _isIndigo = _sharedPreferences.getBool("themeData") ?? true;
  }
}
