import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({Key? key}) : super(key: key);

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();

  var formKey = GlobalKey<FormState>();

  String title = '';

  String description = '';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);

    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.03),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.add_new_task,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: 23, color: MyTheme.blackColor),
          ),
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    onChanged: (text) {
                      title = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return AppLocalizations.of(context)!
                            .please_enter_task_title;
                      }
                      return null;
                    },
                    decoration: provider.isDarkMode()
                        ? InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: MyTheme.greyColor)),
                            label: Text(
                                AppLocalizations.of(context)!.enter_task_title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: MyTheme.greyColor)))
                        : InputDecoration(
                            label: Text(AppLocalizations.of(context)!
                                .enter_task_title)),
                  ),
                  TextFormField(
                    onChanged: (text) {
                      description = text;
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return AppLocalizations.of(context)!
                            .please_enter_task_description;
                      }
                      return null;
                    },
                    decoration: provider.isDarkMode()
                        ? InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: MyTheme.greyColor)),
                            label: Text(
                                AppLocalizations.of(context)!
                                    .enter_task_description,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: MyTheme.greyColor)))
                        : InputDecoration(
                            label: Text(AppLocalizations.of(context)!
                                .enter_task_description)),
                    maxLines: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      AppLocalizations.of(context)!.select_date,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MyTheme.greyColor),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showCalendar();
                      setState(() {});
                    },
                    child: Text(
                      '${selectedDate.day}/'
                      '${selectedDate.month}/${selectedDate.year}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ElevatedButton(
                        onPressed: () {
                          addTask();
                        },
                        child: Text(
                          AppLocalizations.of(context)!.add,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: MyTheme.whiteColor),
                        )),
                  )
                ],
              ))
        ],
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState!.validate() == true) {}
  }
}
