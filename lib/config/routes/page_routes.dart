import 'package:flutter/material.dart';
import 'package:organico/screens/authentication/view/mainauthview/main_auth_view.dart';
import 'package:organico/screens/authentication/view/pages/splash_view.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/mainauthview':
        return _pages(MainAuthView());
            case '/splashview':
        return _pages(SplashView());
    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
