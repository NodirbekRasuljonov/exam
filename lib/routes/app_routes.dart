import 'package:exam/onboarding/auth/view/forgot_password_page.dart';
import 'package:exam/onboarding/auth/view/otp_page.dart';
import 'package:exam/onboarding/auth/view/reset_password_page.dart';
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
        case '/forgotpass':
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordPage(),
        );
        case '/otp':
        return MaterialPageRoute(
          builder: (context) => OTPPage(),
        );
        case '/respass':
        return MaterialPageRoute(
          builder: (context) => ResetPasswordPage(),
        );
    }
  }
}
