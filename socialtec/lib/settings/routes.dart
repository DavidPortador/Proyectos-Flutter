import 'package:flutter/material.dart';
import 'package:socialtec/screens/login/login_screen.dart';
import 'package:socialtec/screens/nasa/nasa_screen.dart';
import 'package:socialtec/screens/onboarding/onboarding_screen.dart';
import 'package:socialtec/screens/signup/signup_screen.dart';
import 'package:socialtec/screens/theme/theme_screen.dart';
import 'package:socialtec/screens/post/post_screen.dart';
import 'package:socialtec/screens/post/add_post_screen.dart';
import 'package:socialtec/screens/movies/list_popular.dart';
import 'package:socialtec/screens/events/events_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{

    '/': (BuildContext context) => OnboardingScreen(),
    //'/': (BuildContext context) => LoginScreen(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/signup': (BuildContext context) => const SignUpScreen(),
    '/theme': (BuildContext context) => const ThemeScreen(),
    '/post': (BuildContext context) => PostScreen(),
    '/add': (BuildContext context) => AddPostScreen(),
    '/popular': (BuildContext context) => const ListPopular(),
    '/events': (BuildContext context) => const EventsScreen(),
    '/nasa': (BuildContext context) => const NasaScreen(),
  };
}
