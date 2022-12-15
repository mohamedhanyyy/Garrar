import 'package:flutter/material.dart';
import 'package:garrar/features/auth/view/screens/login_screen.dart';
import 'package:garrar/features/auth/view/screens/reset_password_screen.dart';
import 'package:garrar/features/auth/view/screens/signup_screen.dart';
import 'package:garrar/features/auth/view/screens/verify_email_screen.dart';

import '../../features/auth/view/screens/change_password_screen.dart';
import '../../features/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = 'loginScreen';
  static const String signup = 'signupScreen';
  static const String verifyEmail = 'verifyEmailScreen';
  static const String resetPassword = 'resetPasswordScreen';
  static const String changePassword = 'changePasswordScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) => SignupScreen());
      case Routes.verifyEmail:
        return MaterialPageRoute(
            builder: (BuildContext context) =>   VerifyEmailScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ResetPasswordScreen());
      case Routes.changePassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChangePasswordScreen());

      default:
        return MaterialPageRoute(
            builder: (BuildContext context) => const NoRouteFoundScreen());
    }
  }
}

class NoRouteFoundScreen extends StatelessWidget {
  const NoRouteFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("ERROR, NO PAGE FOUND");
  }
}
