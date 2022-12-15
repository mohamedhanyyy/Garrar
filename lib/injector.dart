import 'package:garrar/features/auth/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setupLocator() {
   locator.registerLazySingleton(() => AuthCubit());
}
