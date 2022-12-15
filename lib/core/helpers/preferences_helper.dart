import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static SharedPreferences? preferences;

  static void init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken({required String token}) async {
    await preferences?.setString("token", token);
  }

  static String getToken() {
    return preferences?.getString("token") ?? '';
  }

  static void clearPreferences() {
    preferences?.clear();
  }
}
