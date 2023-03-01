import 'package:flutter/material.dart';
import 'package:socialtec/screens/dashboard/dashboard_screen.dart';
import 'package:socialtec/screens/login/login_screen.dart';
import 'package:socialtec/screens/onboarding/onboarding_screen.dart';
import 'package:socialtec/screens/signup/signup_screen.dart';
import 'package:socialtec/screens/theme/saving_theme.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{

    '/theme': (BuildContext context) => SavingTheme(),
    '/dashboard': (BuildContext context) => DashboardScreen(),
    '/login': (BuildContext context) => LoginScreen(),
    '/onboarding': (BuildContext context) => OnboardingScreen(),
    '/signup': (BuildContext context) => SignUpScreen(),

  };
}
