import 'package:flutter/material.dart';
import 'package:socialtec/screens/dashboard/dashboard_screen.dart';
import 'package:socialtec/screens/login/login_screen.dart';
import 'package:socialtec/screens/onboarding/onboarding_screen.dart';
import 'package:socialtec/screens/signup/signup_screen.dart';
import 'package:socialtec/screens/theme/theme_screen.dart';
import 'package:socialtec/screens/post/post_screen.dart';
import 'package:socialtec/screens/post/add_post_screen.dart';
import 'package:socialtec/screens/post/list_popular_videos.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{

    '/': (BuildContext context) => OnboardingScreen(),
    '/login': (BuildContext context) => LoginScreen(),
    '/signup': (BuildContext context) => SignUpScreen(),
    '/dashboard': (BuildContext context) => DashboardScreen(),
    '/theme': (BuildContext context) => ThemeScreen(),
    '/post': (BuildContext context) => PostScreen(),
    '/add': (BuildContext context) => AddPostScreen(),
    '/popular': (BuildContext context) => ListPopularVideos(),

  };
}
