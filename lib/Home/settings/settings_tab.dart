import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/settings/theme_bottom_sheet.dart';

import '../../provider/app_config_provider.dart';
import '../my_theme.dart';
import 'language_bottom_sheet.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.05,
        horizontal: MediaQuery.of(context).size.width * 0.08,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.titleSmall),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              /// english / arabic
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              decoration: provider.isLightMode()
                  ? BoxDecoration(
                      color: MyTheme.whiteColor,
                      border: Border.all(color: MyTheme.primaryColor, width: 2),
                    )
                  : BoxDecoration(
                      color: MyTheme.backgroundDarkColor,
                      border: Border.all(color: MyTheme.primaryColor, width: 2),
                    ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.appLanguage == 'en'
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleMedium),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color: MyTheme.primaryColor,
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.07,
          ),

//////////////////////////////////////////////////////////////////////////

          Text(AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.titleSmall),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          GestureDetector(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              /// light / dark
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              decoration: provider.isLightMode()
                  ? BoxDecoration(
                      color: MyTheme.whiteColor,
                      border: Border.all(color: MyTheme.primaryColor, width: 2),
                    )
                  : BoxDecoration(
                      color: MyTheme.backgroundDarkColor,
                      border: Border.all(color: MyTheme.primaryColor, width: 2),
                    ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      provider.isDarkMode()
                          ? AppLocalizations.of(context)!.dark
                          : AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.titleMedium),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color: MyTheme.primaryColor,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}
