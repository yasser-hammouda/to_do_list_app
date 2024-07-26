import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../setting/preferences_util.dart';

class AppConfigProvider extends ChangeNotifier {
  // 1- Data that will affect on more than one widgets
  String appLanguage = 'en'; // must have default value. cos local take string
  // this function to save user settings
  ThemeMode appTheme = ThemeMode.light;
  AppConfigProvider() {
    _loadPreferences();
  }
  void _loadPreferences() async {
    appLanguage = await PreferencesUtil.getLanguage() ?? 'en';
    appTheme = (await PreferencesUtil.isDarkMode() ?? false) ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
// 2- create a function that will change the data
  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    PreferencesUtil.saveLanguage(newLanguage);
    // after change Data you must call notifyListeners()
    // each provider has many listeners whose function is waiting for change date to take certaion action
    notifyListeners();
    //3- ask youself which screen will affect by change these data
    // in our case it will affect the whole screen
  }

// create a Function for theme mode
  void changeTheme(ThemeMode newMode) {
    if (appTheme == newMode) {
      return;
    }
    appTheme = newMode;
    PreferencesUtil.saveThemeMode(newMode == ThemeMode.dark);
    notifyListeners();
  }

  bool isDarkMode() {
    return appTheme == ThemeMode.dark;
  }
}
