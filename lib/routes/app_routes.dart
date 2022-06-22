import 'package:exam/onboarding/auth/view/signin_page.dart';
import 'package:exam/onboarding/auth/view/signup_page.dart';
import 'package:exam/onboarding/splashscreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings s) {
    var args = s.arguments;
    switch (s.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
        case '/signIn':
        return MaterialPageRoute(
          builder: (context) => SignInPage(),
        );
         case '/signUp':
        return MaterialPageRoute(
          builder: (context) => SignUpaPage(),
        );
    }
  }
}
