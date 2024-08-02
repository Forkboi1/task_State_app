import 'package:app_management/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tasks_page.dart';
import 'welcome_page.dart';

class MyTasks extends StatefulWidget {
  @override
  State<MyTasks> createState() => _MyTasksState();
}
class _MyTasksState extends State<MyTasks> {
  var _selectedIndex = 0;
  final List<Widget> widgetList = [
    const WelcomePage(),
    const TasksPage(),
  ];

  void _onSelectedItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Builder(builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(context).colorScheme.onPrimary
              ),
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu),
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }),
      ),
      body: widgetList[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              leading: Icon(Icons.home, color: Theme.of(context).colorScheme.primary),
              selected: _selectedIndex == 0,
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _onSelectedItem(0);
              },
            ),
            ListTile(
              title: Text(
                "Tasks Page",
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              leading: Icon(Icons.task, color: Theme.of(context).colorScheme.primary),
              selected: _selectedIndex == 1,
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                _onSelectedItem(1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

