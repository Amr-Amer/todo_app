import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/app_config_provider.dart';
import '../my_theme.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.03,
          vertical: MediaQuery.of(context).size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () {
                /// change Theme dark
                provider.changeTheme(ThemeMode.dark);
              },
              child: provider.isDarkMode()
                  ? getSelectedThemeWidget(AppLocalizations.of(context)!.dark)
                  : getUnSelectedItemWidget(
                      AppLocalizations.of(context)!.dark)),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          InkWell(
            onTap: () {
              /// change Theme light
              provider.changeTheme(ThemeMode.light);
            },
            child: provider.isLightMode()
                ? getSelectedThemeWidget(AppLocalizations.of(context)!.light)
                : getUnSelectedItemWidget(AppLocalizations.of(context)!.light),
          ),
        ],
      ),
    );
  }

  Widget getSelectedThemeWidget(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: MyTheme.primaryColor)),
        Icon(
          Icons.check,
          size: 35,
          color: MyTheme.primaryColor,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text) {
    return Text(text, style: Theme.of(context).textTheme.titleSmall);
  }
}
