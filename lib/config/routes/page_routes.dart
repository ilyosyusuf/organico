import 'package:flutter/material.dart';
import 'package:organico/screens/authentication/view/mainauthview/main_auth_view.dart';
import 'package:organico/screens/authentication/view/pages/splash_view.dart';
import 'package:organico/screens/home/view/mainview/main_view.dart';
import 'package:organico/screens/home/view/pages/profile/notifications/notification_view.dart';
import 'package:organico/screens/home/view/pages/profile/profilemainview/profile_view.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute._init();
  static MyRoute get instance => _instance;
  MyRoute._init();

  Route? onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case '/mainauthview':
        return _pages(MainAuthView());
      case '/mainview':
        return _pages(MainView());
      case '/splashview':
        return _pages(SplashView());
      case '/profileview':
        return _pages(ProfileView());
      case '/notificationview':
        return _pages(NotificationView());
    }
  }

  _pages(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
