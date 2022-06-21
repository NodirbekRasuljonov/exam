
import 'package:exam/onboarding/splashscreen.dart';
import 'package:flutter/material.dart';

class AppRoutes{
  Route? onGenerateRoute(RouteSettings s){
    var args=s.arguments;
    switch (s.name) {
      case '/splash':
      return MaterialPageRoute(builder: (context)=>SplashScreen(),);
    }
  }
}