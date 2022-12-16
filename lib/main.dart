import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/helpers/preferences_helper.dart';
import 'package:garrar/features/auth/cubit/auth_cubit.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_cubit.dart';

import 'core/config/routes.dart';
import 'core/config/themes.dart';
import 'core/helpers/dio_helper.dart';
import 'injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await EasyLocalization.ensureInitialized();

  PreferencesHelper.init();
  DioHelper.init();
  runApp(
    MyApp()
    // EasyLocalization(
    //   supportedLocales: const [Locale('en'), Locale('ar')],
    //   saveLocale: true,
    //   path: 'assets/language',
    //   fallbackLocale: const Locale('ar'),
    //   child: const MyApp(),
    //),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              create: (context) => AuthCubit(),
            ),
            BlocProvider(
              create: (context) => MarineOrderCubit(),
            ),
          ],
          child: BackGestureWidthTheme(
            backGestureWidth: BackGestureWidth.fraction(1 / 2),
            child: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: MaterialApp(
                // localizationsDelegates: context.localizationDelegates,
                // supportedLocales: context.supportedLocales,
                // locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: appTheme(),
                title: 'Garrar',
                initialRoute: Routes.home,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              ),
            ),
          ),
        );
      },
    );
  }
}
