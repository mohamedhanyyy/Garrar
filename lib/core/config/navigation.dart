import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/splash/splash_screen.dart';

class NavigationManager {
  static void navigateToPage(
      {required BuildContext context, required String routeName}) {
    Navigator.of(context).pushNamed(routeName);
  }

  static void navigateReplacementToPage(
      {required BuildContext context, required String routeName}) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  static void navigateWithRemoveAllRoutes({required BuildContext context}) {
    Navigator.of(context).pushAndRemoveUntil<void>(
        MaterialPageRoute<void>(
            builder: (BuildContext context) => const SplashScreen()),
        ModalRoute.withName('/'));
  }
}
