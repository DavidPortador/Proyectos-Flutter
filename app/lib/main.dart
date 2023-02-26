//import 'package:app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:app/routes.dart';
import 'package:app/screens/login_screen.dart';
//import 'package:provider/provider.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'theme_config.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? darkBlueTheme : lightTheme;
    return ThemeProvider(
      initTheme: initTheme,
      builder: (_, myTheme) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: myTheme,
          routes: getApplicationRoutes(),
          home: LoginScreen(),
        );
      },
    );
  }
}








