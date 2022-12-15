import 'package:flutter/material.dart';

import '../utils/colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primaryColor: ColorsManager.primary,
    hintColor: ColorsManager.black,
    primarySwatch: Colors.green,
    fontFamily: 'Urbanist',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
