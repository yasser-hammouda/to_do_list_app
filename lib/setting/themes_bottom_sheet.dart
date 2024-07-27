import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/app_colors.dart';
import '../providers/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            // english selected
            child: provider.appTheme == ThemeMode.dark
                ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.dark),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: provider.appTheme == ThemeMode.light
                ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                : getUnselectedItemWidget(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        Icon(
          Icons.check,
          size: 35,
          color: AppColors.primaryColor,
        ),
      ],
    );
  }

  Widget getUnselectedItemWidget(String text) {
    return Text(text,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
