import 'package:app_management/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_tasks.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
          onPrimary: Colors.white,
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 36,
            color: Colors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 14,
            color: Colors.white
          ),
        ),
      ),
      home: MyTasks(),
    );
  }
}
