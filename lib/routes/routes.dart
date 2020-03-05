import 'package:firstapp_bloc_api/screens/homeScreen/homeScreen.dart';
import 'package:firstapp_bloc_api/screens/loginscreen/loginScreen.dart';
import 'package:firstapp_bloc_api/screens/signupScreen/signupScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route buildRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/login":
        return buildRoute(settings, LoginScreen());
      case "/home":
        return buildRoute(settings, HomeScreen());
      case "/signup":
        return buildRoute(settings, SignUpScreen());
      default:
        return null;
    }
  }

  static CupertinoPageRoute buildRoute(RouteSettings settings, Widget builder) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }
}
