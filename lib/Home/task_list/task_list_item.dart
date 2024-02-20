import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/Home/my_theme.dart';
import 'package:todo_app/provider/app_config_provider.dart';

import '../../model/task.dart';

class TaskListItem extends StatelessWidget {
  Task task;

  TaskListItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      decoration: provider.isLightMode()
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyTheme.whiteColor)
          : BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: MyTheme.blackColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01,
                horizontal: MediaQuery.of(context).size.height * 0.02),
            color: MyTheme.primaryColor,
            height: 80,
            width: 5,
          ),
          Expanded(
              child: Column(
            children: [
              Text(task.title ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: MyTheme.primaryColor)),
              Text(
                task.description ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: MyTheme.primaryColor),
              )
            ],
          )),
          Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.02,
                vertical: MediaQuery.of(context).size.width * 0.01,
              ),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: MyTheme.primaryColor),
              child: Icon(
                Icons.check,
                color: MyTheme.whiteColor,
                size: 30,
              ))
        ],
      ),
    );
  }
}
