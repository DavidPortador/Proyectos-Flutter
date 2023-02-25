import 'package:flutter/material.dart';
import 'package:aplicacion_curso/screens/dashboard_screen.dart';
import 'package:aplicacion_curso/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{

    '/register': (BuildContext context) => RegisterScreen(),
    '/dash': (BuildContext context) => DashboardScreen(),

  };
}
