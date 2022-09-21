import 'package:flutter/material.dart';

class Task {
  String name;
  bool checked;

  Task({required this.name, required this.checked});
}

class MyState extends ChangeNotifier {
  List<Task> _list = [];

  List<Task> get list => _list;

  void addTask(Task task) {
    _list.add(task);
    notifyListeners();
  }

  void deleteTask(Task task) {
    _list.remove(task);
    notifyListeners();
  }

  void checkTask(Task task) {
    task.checked = true;
    notifyListeners();
  }

  void uncheckTask(Task task) {
    task.checked = false;
    notifyListeners();
  }
}
