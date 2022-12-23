import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garrar/features/auth/cubit/auth_cubit.dart';
import 'package:garrar/features/domestic_order/cubit/domestic_order_cubit.dart';
import 'package:garrar/features/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:garrar/features/marine_order/cubit/marine_order_cubit.dart';
import 'package:garrar/features/my_orders/cubit/my_orders_cubit.dart';
import 'package:garrar/features/profile/cubit/profile_cubit.dart';
import 'core/config/routes.dart';
import 'core/config/themes.dart';

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
              child: MaterialApp(
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                debugShowCheckedModeBanner: false,
                theme: appTheme(),
                darkTheme: ThemeData.dark(),
                themeMode: ThemeMode.light,
                title: 'Garrar Shipping',
                initialRoute: Routes.initialRoute,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              ),
            ),
          ),
        );
      },
    );
  }
}
