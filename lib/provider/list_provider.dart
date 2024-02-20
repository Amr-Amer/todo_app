import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../firebase_utils.dart';
import '../model/task.dart';

class ListProvider extends ChangeNotifier {
  List<Task> tasksList = [];

  DateTime selectedDate = DateTime.now();

  void getAllTasksFromFireStore() async {
    QuerySnapshot<Task> querySnapshot =
        await FirebaseUtils.getTasksCollection().get();
    tasksList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    // filter all tasks

    tasksList.where((task) {
      if (selectedDate.day == task.dateTime?.day &&
          selectedDate.month == task.dateTime?.month &&
          selectedDate.year == task.dateTime?.year) {
        return true;
      }
      return false;
    }).toList();

    void changeSelectDate(DateTime newSelectDate) {
      selectedDate = newSelectDate;
      getAllTasksFromFireStore();
      notifyListeners();
    }
  }
}
