import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../app_colors.dart';
import '../providers/app_config_provider.dart';

class TaskListItem extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width =  MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.68,
      height: height *0.16,
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: provider.isDarkMode() ?
           AppColors.blackDarkColor :
        AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Container(
          //   color: Colors.cyan,
          //   margin: EdgeInsets.all(12),
          //   height: 100,
          //   width: 100,
          // ),
          VerticalDivider(
            width: 20,
            thickness: 8,
            color: 
            provider.isDarkMode() ?
            AppColors.primaryColor:
            AppColors.primaryColor,
          ),
          SizedBox(width: 10,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( AppLocalizations.of(context)!.task_title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: provider.isDarkMode() ?
                      AppColors.whiteColor :
                      AppColors.primaryColor,
              ),),
              SizedBox(height: 5,),
              Text( AppLocalizations.of(context)!.task_description,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: provider.isDarkMode() ?
                  AppColors.whiteColor :
                  AppColors.blackLightColor,
                ),),
            ],
          ),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: width *0.055, vertical: width *0.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
                color: provider.isDarkMode() ?
                AppColors.primaryColor:
                AppColors.primaryColor,
            ),
            child: Icon(Icons.check,color: AppColors.whiteColor,size: 35,),
          ),

        ],
      ),
    );
  }
}
