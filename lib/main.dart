import 'package:flutter/material.dart';
import 'package:organico/config/init/navigation/navigator.dart';
import 'package:organico/config/routes/page_routes.dart';
import 'package:organico/config/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Organico',
      theme: AppTheme.instance.appLightTheme,
      navigatorKey: NavigationService.instance.navigatorKey,
      initialRoute: '/mainview',
      onGenerateRoute: MyRoute.instance.onGenerateRoute,
    );
  }
}