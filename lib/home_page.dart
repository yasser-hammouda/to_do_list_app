
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
static const String routeName='home_page';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width =  MediaQuery.of(context).size.width;
    return  Scaffold(
      appBar: AppBar(
        title: Text('To Do List',),
        toolbarHeight:  height *0.15,
      ),
    );
  }
}
