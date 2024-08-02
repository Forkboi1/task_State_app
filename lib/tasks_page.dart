import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'task.dart';
import 'task_model.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskModel taskModel = Provider.of<TaskModel>(context);
    return Scaffold(
      body: taskModel.totalTasks != 0
          ? taskList(taskModel, context)
          : Center(
              child: Text(
                'No tasks available',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskBottomSheet(context, taskModel);
        },
        child: Icon(Icons.add),
      ),
    );
  }

void _showAddTaskBottomSheet(BuildContext context, TaskModel taskModel) {
  final TextEditingController taskController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // This makes the bottom sheet adjustable to keyboard
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.7, // This makes the bottom sheet take up at least half the screen
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "Add Task",
                    style: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
                TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    labelText: 'Task Title',
                    labelStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    String taskTitle = taskController.text.trim();
                    if (taskTitle.isNotEmpty) {
                      taskModel.add(Task(title: taskTitle));
                      Navigator.pop(context);
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Add",
                      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

    Scaffold taskList(TaskModel tasks, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Todoey",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "${tasks.totalTasks} Tasks",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: generateTasks(tasks, context),
        ),
      ),
    );
  }

    List<Widget> generateTasks(TaskModel tasks, BuildContext context) {
    return tasks.getTasks.map((task) {
      TextDecoration textDecoration =
          task.isDone ? TextDecoration.lineThrough : TextDecoration.none;
      return Row(
        children: [
          Text(
            task.title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              decoration: textDecoration,
              decorationColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Spacer(),
          Checkbox(
              value: task.isDone,
              onChanged: (flag) {
                tasks.checkTask(task);
              })
        ],
      );
    }).toList();
  }

}
