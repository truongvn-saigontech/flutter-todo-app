import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/configs/routes/calendar.dart';
import 'package:to_do_app/screens/calendar/calendar.screen.dart';
import 'package:to_do_app/screens/list_tasks/list_tasks.screen.dart';
import 'package:to_do_app/screens/manage_task/manage_task.screen.dart';
import 'configs/routes/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: CALENDAR_PATH,
      routes: {
        LIST_TASKS_PATH: (context) =>
            ListTasksScreen(title: 'Flutter Demo Home Page'),
        MANAGE_TASK_PATH: (context) => const ManageTaskScreen(),
        CALENDAR_PATH: (context) => const CalendarScreen(),
      },
    );
  }
}
