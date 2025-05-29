import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool get isLoggedIn => _prefs.getBool('isLoggedIn') ?? false;
  static set isLoggedIn(bool value) => _prefs.setBool('isLoggedIn', value);

  static String? get bookmarks => _prefs.getString('bookmarks');
  static set bookmarks(String? value) => _prefs.setString('bookmarks', value ?? '');
}