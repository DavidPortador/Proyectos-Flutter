import 'package:flutter/material.dart';
import 'package:app/screens/dashboard_screen.dart';
import 'package:app/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{

    '/register': (BuildContext context) => RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),

  };
}
