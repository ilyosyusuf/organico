import 'package:flutter/material.dart';

class AppTheme{
  static get apptheme => ThemeData(
    useMaterial3: true,
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: Colors.white,
    )
  );
}