import 'package:get_it/get_it.dart';

import 'core/helpers/dio_helper.dart';
import 'core/utils/dialouges.dart';

final GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => Dialogues());
  locator.registerLazySingleton(() => DioHelper());
}
