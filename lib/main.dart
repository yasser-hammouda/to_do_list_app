import 'package:flutter/material.dart';
import 'package:to_do_list/home_page.dart';
import 'package:to_do_list/my_theme_data.dart';

void main (){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (context)=> HomePage(),
      },
      theme: MyThemeData.lightMode ,
      themeMode: ThemeMode.dark,
      darkTheme: MyThemeData.darkMode,
    );
  }
}
