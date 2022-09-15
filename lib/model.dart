import 'package:flutter/material.dart';
import 'InternetFetcher.dart';

class Task {
  String? id;
  String? title;
  bool? done;

  Task({this.id, this.title, this.done});

  Task.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    done = json['done'];
  }
}

class MyState extends ChangeNotifier {
//API KEY
//2ff216a5-d5d1-411b-b758-1f2d18ad5645

  String _filter = 'Show All';
  String get filter => _filter;

  void updateFilter(String newValue) {
    _filter = newValue;
    notifyListeners();
  }

  List<Task> _list = [];
  List<Task> get list => _list;

  void fetchTasks() async {
    var list = await Fetcher.fetchTasks();
    _list = list;
    notifyListeners();
  }

  MyState() {
    fetchTasks();
  }

  void addTask(Task task) async {
    await Fetcher.addTask(task.title ?? '', task.done ?? false);
    fetchTasks();
    notifyListeners();
  }

  void deleteTask(Task task) async {
    await Fetcher.deleteTask(task.id ?? '');
    fetchTasks();
    notifyListeners();
  }

  void updateTask(Task task) async {
    if (task.title != null && task.done != null) {
      await Fetcher.updateTask(
          task.id ?? '', task.title ?? '', task.done ?? false);
      fetchTasks();
      notifyListeners();
    }
  }

  void checkTask(Task task) async {
    if (task.title != null && task.done != null) {
      await Fetcher.updateTask(task.id ?? '', task.title ?? '', true);
      fetchTasks();
      notifyListeners();
    }
  }

  void uncheckTask(Task task) async {
    if (task.title != null && task.done != null) {
      await Fetcher.updateTask(task.id ?? '', task.title ?? '', false);
      fetchTasks();
      notifyListeners();
    }
  }
}
