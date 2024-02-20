import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/task_list/task_list_item.dart';
import 'package:todo_app/provider/app_config_provider.dart';

import '../../provider/list_provider.dart';
import '../my_theme.dart';

class TaskListTab extends StatefulWidget {
  const TaskListTab({super.key});

  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    var listProvider = Provider.of<ListProvider>(context);

    listProvider.getAllTasksFromFireStore();

    return Column(
      children: [
        EasyDateTimeLine(
          onDateChange: (selectedDate) {
            listProvider.selectedDate;
          },
          initialDate: DateTime.now(),
          activeColor: provider.isDarkMode()
              ? MyTheme.primaryColor
              : MyTheme.primaryColor,
          dayProps: EasyDayProps(
            todayHighlightStyle: TodayHighlightStyle.withBackground,
            inactiveDayStyle: DayStyle(
                dayStrStyle: TextStyle(
                    color: provider.isDarkMode()
                        ? MyTheme.blackColor
                        : MyTheme.blackColor),
                monthStrStyle: TextStyle(
                    color: provider.isDarkMode()
                        ? MyTheme.blackColor
                        : MyTheme.blackColor),
                dayNumStyle: TextStyle(
                    color: provider.isDarkMode()
                        ? MyTheme.blackColor
                        : MyTheme.blackColor),
                decoration: BoxDecoration(
                    color: provider.isDarkMode()
                        ? MyTheme.whiteColor
                        : MyTheme.whiteColor,
                    borderRadius: BorderRadius.circular(12))),
          ),
          locale: provider.appLanguage,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskListItem(
                task: listProvider.tasksList[index],
              );
            },
            itemCount: listProvider.tasksList.length,
          ),
        )
      ],
    );
  }
}
