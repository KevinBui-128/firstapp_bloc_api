import 'package:firstapp_bloc_api/routes/routes.dart';
import 'package:firstapp_bloc_api/screens/loginscreen/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      onGenerateRoute: RouteGenerator.buildRoutes,
      initialRoute: "/",
    );
  }
}
