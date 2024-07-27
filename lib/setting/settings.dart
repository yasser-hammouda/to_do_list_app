
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app_colors.dart';
import 'package:to_do_list/home/add_task_bottom_sheet.dart';
import 'package:to_do_list/home/task_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:to_do_list/setting/language_botton_sheet.dart';
import 'package:to_do_list/setting/themes_bottom_sheet.dart';
import '../providers/app_config_provider.dart';



class SettingsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
            //AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                     provider.appLanguage == 'en'
                         ? AppLocalizations.of(context)!.english
                         : AppLocalizations.of(context)!.arabic,
                     style: Theme.of(context).textTheme.titleLarge,
                   ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet(context);
            },
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.isDarkMode()
                         ? AppLocalizations.of(context)!.dark
                        : AppLocalizations.of(context)!.light,
                     style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => LanguageBottomSheet(
        // onLanguageSelected: (Language){
        //   provider.changeLanguage(language);
        //   Navigator.pop(context);
        // }
      ),
      //backgroundColor: AppColors.primaryLightColor,
    );
  }

   void showThemeBottomSheet(BuildContext context ) {
    showModalBottomSheet(
      //backgroundColor: AppColors.yellowColor,
        context: context,
        builder: (context) => ThemeBottomSheet(
          // onThemeSelected : (isDarkMOde) {
          //   provider.changeTheme(isDarkMode ? ThemeMode.dark : ThemeMode.light);
          //   Navigator.pop(context);
          // }
        ),
    );
  }
}
