import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:socialtec/settings/theme_config.dart';
import 'package:socialtec/settings/routes.dart';
import 'package:socialtec/screens/onboarding/onboarding_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
    final initTheme = isPlatformDark ? darkTheme : lightTheme;
    
    // En lugar de tomar el tema del sistema hay que usar uno seleccionado
    return ThemeProvider(
      initTheme: initTheme,
      builder: (_, myTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'S O C I A L T E C',
          theme: myTheme,
          routes: getApplicationRoutes(),
          home: OnboardingScreen(),
        );
      },
    );
  }
}
