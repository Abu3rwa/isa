import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAppTheme {
  setLightThem() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("primaryBg", "Colors.teal[800]");
    prefs.setString("secondaryBg", "Colors.cyan[800]");
    prefs.setString("Bg", "Colors.cyan[800]");
    prefs.setString("mainTextColor", "Colors.black54");
    prefs.setString("mainBg", "Colors.grey[100]");
    prefs.setString("secondaryGreyBg", "Colors.grey[200]");
  }

  setDarkTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("primaryBg", "Colors.teal[800]");
    prefs.setString("secondaryBg", "Colors.cyan[800]");
    prefs.setString("Bg", "Colors.cyan[800]");
    prefs.setString("mainTextColor", "Colors.black54");
    prefs.setString("mainBg", "Colors.grey[100]");
    prefs.setString("secondaryGreyBg", "Colors.grey[200]");
  }

  static var primaryBg = Colors.cyan[800];
  static var secondaryBg = Colors.amber[800];
  static var darkTextColor = Colors.black87;
  static var mainTextColor = Colors.black54;
  static var lightTextColor = Colors.black38;
  static var lighterTextColor = Colors.black26;
  static var mainBg = Colors.grey[100];
  static var white = Colors.white;
  static var secondaryGreyBg = Colors.grey[200];
}
