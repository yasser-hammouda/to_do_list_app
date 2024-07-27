
import 'package:flutter/material.dart';
import 'package:to_do_list/app_colors.dart';
import 'package:to_do_list/home/add_task_bottom_sheet.dart';
import 'package:to_do_list/home/task_list.dart';
import 'package:to_do_list/providers/app_config_provider.dart';
import 'package:to_do_list/setting/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
static const String routeName='home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width =  MediaQuery.of(context).size.width;
    var provider = Provider.of<AppConfigProvider>(context);

    return  Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.app_title,
        style: Theme.of(context).textTheme.titleLarge,),
        //toolbarHeight:  height *0.15,
      ),
      // body: tabs[selectedIndex],
      body: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            width: double.infinity,
            height: height * 0.1,
          ),
          Expanded(child:
          tabs[selectedIndex]),
          // selectedIndex == 0 ? TaskLIstTab() : SettingsTab(),
          // we can use this method without define List as we have two options only
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color:provider.isDarkMode() ?
            AppColors.backgroundDarkColor:
            AppColors.backgroundLightColor,
          ),
        ),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Container(
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(12),
            //   border: Border.all(
            //     width: 2,
            //     color: AppColors.backgroundDarkColor,
            //   ),
            // ),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex =index;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.list,size: 35,),
                label: AppLocalizations.of(context)!.list),
                BottomNavigationBarItem(icon: Icon(Icons.settings,size: 35,),
                    label: AppLocalizations.of(context)!.setting),

              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
             addTaskBottomSheet();
        },
        child: Icon(Icons.add,size: 35,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
  List<Widget> tabs =[TaskLIstTab(),SettingsTab()];

  void addTaskBottomSheet() {
    showModalBottomSheet(context: context,
        builder: (context)=>AddTaskBottomSheet());
  }
}
