import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/home_page.dart';
import 'package:to_do_list/my_theme_data.dart';
import 'package:to_do_list/providers/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?
  await Firebase.initializeApp(
    options :const FirebaseOptions(apiKey: 'AIzaSyDFe1HxVMMvuaClaqwQlUv1u1zzBJPKMfE', // = current_key in Json
        appId: 'com.example.to_do_list',  //package_name in Json
        messagingSenderId: '590074684851', // project_number in Json
        projectId: 'to-do-list-app-77278' //project_id in Json
    )
  ):
  await Firebase.initializeApp ();
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
