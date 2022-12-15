import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/core/helpers/preferences_helper.dart';
import 'package:garrar/features/auth/cubit/auth_cubit.dart';

import 'core/config/routes.dart';
import 'core/config/themes.dart';
import 'injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  PreferencesHelper.init();
  runApp(const MyApp());
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
            BlocProvider(create: (context) => LoginCubit()),
          ],
          child: BackGestureWidthTheme(
            backGestureWidth: BackGestureWidth.fraction(1 / 2),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: appTheme(),
              title: 'Garrar',
              initialRoute: Routes.signup,
              onGenerateRoute: AppRoutes.onGenerateRoute,
            ),
          ),
        );
      },
    );
  }
}
