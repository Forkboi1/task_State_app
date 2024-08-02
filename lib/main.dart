import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_app.dart';
import 'my_tasks.dart';
import 'task_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskModel(),
      child: const MainApp(),
    ),
  );
}
