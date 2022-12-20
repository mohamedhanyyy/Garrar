import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/helpers/preferences_helper.dart';
import 'package:garrar/features/auth/cubit/auth_cubit.dart';
import 'package:garrar/features/domestic_order/cubit/domestic_order_cubit.dart';
import 'package:garrar/features/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_cubit.dart';
import 'package:garrar/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:garrar/features/profile/cubit/profile_cubit.dart';

import 'core/config/routes.dart';
import 'core/config/themes.dart';
import 'core/helpers/dio_helper.dart';
import 'injector.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  PreferencesHelper.init();
  DioHelper.init();
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    basePath: 'assets/locales',
    supportedLocales: ['en_US', 'es', 'fa', 'ar', 'ru'],
  );

  runApp(LocalizedApp(delegate, const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return ScreenUtilInit(
      designSize: const Size(360, 800),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => AuthCubit(),
            ),
            BlocProvider(
              create: (BuildContext context) => MarineOrderCubit(),
            ),
            BlocProvider(
              create: (context) => ProfileCubit(),
            ),
            BlocProvider(
              create: (BuildContext context) => EditProfileCubit(),
            ),
            BlocProvider(
              create: (BuildContext context) => MyOrdersCubit(),
            ),
            BlocProvider(
              create: (BuildContext context) => DomesticOrderCubit(),
            ),
          ],
          child: BackGestureWidthTheme(
            backGestureWidth: BackGestureWidth.fraction(1 / 2),
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: LocalizationProvider(
                state: LocalizationProvider.of(context).state,
                child: MaterialApp(
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    localizationDelegate
                  ],
                  supportedLocales: localizationDelegate.supportedLocales,
                  locale: PreferencesHelper.getLang() != true
                      ? const Locale("ar")
                      : const Locale('en_US'),
                  debugShowCheckedModeBanner: false,
                  theme: appTheme(),
                  darkTheme: ThemeData.dark(),
                  themeMode: ThemeMode.light,
                  title: 'Garrar',
                  initialRoute: Routes.initialRoute,
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
