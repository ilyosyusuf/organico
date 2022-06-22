import 'package:flutter/material.dart';
import 'package:organico/core/constants/colors/color_const.dart';
class AppTheme{

  static final AppTheme _instance = AppTheme._init();
  static AppTheme get instance => _instance;
  AppTheme._init();

  get appDarkTheme => ThemeData(
    useMaterial3: true,
    // backgroundColor: Colors.white,
    fontFamily: 'Nunito',
    // scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: ColorConst.white,
    )
  );
  get appLightTheme => ThemeData(
    useMaterial3: true,
    // backgroundColor: Colors.white,
    fontFamily: 'Nunito',
    // scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: ColorConst.white,
    )
  );
}