import 'package:flutter/material.dart';
import 'package:garrar/features/auth/view/screens/login_screen.dart';
import 'package:garrar/features/auth/view/screens/reset_password_screen.dart';
import 'package:garrar/features/auth/view/screens/signup_screen.dart';
import 'package:garrar/features/auth/view/screens/verify_email_screen.dart';
import 'package:garrar/features/edit_profile/view/edit_profile_screen.dart';
import 'package:garrar/features/home/view/home_screen.dart';
import 'package:garrar/features/marine_order/view/marine_order_screen.dart';
import 'package:garrar/features/profile/view/profile_screen.dart';

import '../../features/auth/view/screens/change_password_screen.dart';
import '../../features/complete_order/view/complete_order_screen.dart';
import '../../features/domestic_order/view/domestic_order_screen.dart';
import '../../features/my_orders/view/my_orders_screen.dart';
import '../../features/splash/splash_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String login = 'loginScreen';
  static const String signup = 'signupScreen';
  static const String verifyEmail = 'verifyEmailScreen';
  static const String resetPassword = 'resetPasswordScreen';
  static const String changePassword = 'changePasswordScreen';
  static const String home = 'homeScreen';
  static const String profile = 'profileScreen';
  static const String myOrders = 'myOrdersScreen';
  static const String editProfile = 'editProfileScreen';
  static const String marineOrder = 'marineOrderScreen';
  static const String domesticOrder = 'domesticOrderScreen';
  static const String completeOrder = 'completeOrderScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case Routes.login:
        return MaterialPageRoute(
            builder: (BuildContext context) =>   LoginScreen());
      case Routes.signup:
        return MaterialPageRoute(
            builder: (BuildContext context) =>   const SignupScreen());
      case Routes.verifyEmail:
        return MaterialPageRoute(
            builder: (BuildContext context) => VerifyEmailScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ResetPasswordScreen());
      case Routes.changePassword:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChangePasswordScreen());

      case Routes.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case Routes.profile:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ProfileScreen());
      case Routes.myOrders:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MyOrdersScreen());
      case Routes.editProfile:
        return MaterialPageRoute(
            builder: (BuildContext context) => EditProfileScreen());
      case Routes.marineOrder:
        return MaterialPageRoute(
            builder: (BuildContext context) => MarineOrderScreen());
      case Routes.domesticOrder:
        return MaterialPageRoute(
            builder: (BuildContext context) => DomesticOrderScreen());
      case Routes.completeOrder:
        return MaterialPageRoute(
            builder: (BuildContext context) => CompleteOrderScreen());

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
