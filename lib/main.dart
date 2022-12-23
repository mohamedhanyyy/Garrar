import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:garrar/application.dart';
import 'package:garrar/core/helpers/preferences_helper.dart';
import 'core/helpers/dio_helper.dart';
import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  PreferencesHelper.init();
  DioHelper.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}
