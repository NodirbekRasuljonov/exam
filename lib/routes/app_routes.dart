import 'package:exam/onboarding/auth/view/forgot_password_page.dart';
import 'package:exam/onboarding/auth/view/otp_page.dart';
import 'package:exam/onboarding/auth/view/reset_password_page.dart';
import 'package:exam/onboarding/auth/view/signin_page.dart';
import 'package:exam/onboarding/auth/view/signup_page.dart';
import 'package:exam/onboarding/splashscreen.dart';
import 'package:exam/views/home/view/home_page.dart';
import 'package:exam/views/profile/view/menus/addres/view/address_page.dart';
import 'package:exam/views/profile/view/menus/changepasswword/view/change_password_page.dart';
import 'package:exam/views/profile/view/menus/editprofile/view/edit_profile_page.dart';
import 'package:exam/views/profile/view/menus/editprofile/view/editprofile_otp.dart';
import 'package:exam/views/profile/view/menus/notifications/view/notification_Settings_page.dart';
import 'package:exam/views/profile/view/menus/notifications/view/notification_page.dart';
import 'package:exam/views/profile/view/menus/orders/view/orders_Page.dart';
import 'package:exam/views/profile/view/menus/payment_method/view/add_payment_method.dart';
import 'package:exam/views/profile/view/menus/payment_method/view/payment_method_page.dart';
import 'package:exam/views/profile/view/profile_main.dart';
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
        case '/home':
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
        case '/profile':
        return MaterialPageRoute(
          builder: (context) => ProfilePage(),
        );
        case '/notification':
        return MaterialPageRoute(
          builder: (context) => NotificationPage(),
        );
        case '/notificationsettings':
        return MaterialPageRoute(
          builder: (context) => NotificationSettings(),
        );
        case '/editprofile':
        return MaterialPageRoute(
          builder: (context) => EditProfilePage(),
        );
        case '/editprofileotp':
        return MaterialPageRoute(
          builder: (context) => EditProfileOTP(),
        );
        case '/changepass':
        return MaterialPageRoute(
          builder: (context) => ChangePasswordPage(),
        );
        case '/address':
        return MaterialPageRoute(
          builder: (context) => AddressPage(),
        );
        case '/payment':
        return MaterialPageRoute(
          builder: (context) => PaymentMethodPage(),
        );
        case '/orders':
        return MaterialPageRoute(
          builder: (context) => OrdersPage(),
        );
        case '/addpayment':
        return MaterialPageRoute(
          builder: (context) => AddPaymnetMethodPage(),
        );
        
    }
  }
}
