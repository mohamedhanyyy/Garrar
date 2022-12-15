import 'package:flutter/cupertino.dart';

class NavigationManager {
  static void navigateToPage(
      {required BuildContext context, required String routeName}) {
    Navigator.of(context).pushNamed(routeName);
  }

  static void navigateReplacementToPage(
      {required BuildContext context, required String routeName}) {
    Navigator.of(context).pushReplacementNamed(routeName);
  }
}
