import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/home_page.dart';
import 'package:to_do_list/my_theme_data.dart';
import 'package:to_do_list/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main (){
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) =>AppConfigProvider(),
      child: MyApp()));
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (context)=> HomePage(),
      },
      theme: MyThemeData.lightMode ,
      themeMode: provider.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      darkTheme: MyThemeData.darkMode,
      locale: Locale(provider.appLanguage),
        title: 'Localizations Sample App',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
