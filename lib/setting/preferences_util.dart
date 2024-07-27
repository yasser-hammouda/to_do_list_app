import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtil {
  static const String _keyLanguage = 'language';
  static const String _keyThemeMode = 'theme_mode';

  static Future<void> saveLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyLanguage, language);
  }

  static Future<String?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyLanguage);
  }

  static Future<void> saveThemeMode(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyThemeMode, isDarkMode);
  }

  static Future<bool?> isDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyThemeMode);
  }
}
