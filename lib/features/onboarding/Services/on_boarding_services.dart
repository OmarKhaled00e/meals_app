import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices {
  static Future<bool> isFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }

  static Future<void> setFirstTime() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false);
  }
}






// // class OnBoardingServices {
//   static late SharedPreferences sharedPreferences;

//   static Future initializeSharedPreferenceStorage() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }

//   static bool isFirstTime() {
//     bool isFirstTime = sharedPreferences.getBool('isFirstTime') ?? true;
//     return isFirstTime;
//   }

//   static setFirstTime() {
//     sharedPreferences.setBool('isFirstTime', false);
//   }
// }
