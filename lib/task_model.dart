import 'package:app_management/main.dart';
import 'package:flutter/cupertino.dart';

import 'task.dart';

class TaskModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  int get totalTasks => _tasks.length;
  List<Task> get getTasks => _tasks;
  void add(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void checkTask(Task task) {
    var index = _tasks.indexOf(task);
    _tasks[index].isDone = !_tasks[index].isDone;
    notifyListeners();
  }
}
