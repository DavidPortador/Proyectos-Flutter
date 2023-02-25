import 'package:flutter/material.dart';
import 'package:aplicacion_curso/routes.dart';
import 'package:aplicacion_curso/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getApplicationRoutes(),
      home: LoginScreen(),
    );
  }
}