import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:to_do_app/configs/routes/tasks.dart';
import 'package:to_do_app/screens/calendar/data.example.dart';
import 'package:to_do_app/screens/list_tasks/list_tasks.controller.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {

  ListTaskController listTaskController = Get.put(ListTaskController());

  List<Calendar> _getDataSource() {
    final List<Calendar> meetings = <Calendar>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.addAll([
      Calendar(
          'Conference', startTime, endTime, const Color(0xFF0F8644), false),
      Calendar('New', startTime, endTime, Colors.red, false),
      Calendar('Meeting with John', startTime, endTime, Colors.blue, false),
    ]);
    // print("meetings => ${meetings}");
    return meetings;
  }

  void handeLongPress(CalendarLongPressDetails details) {
    DateTime date = details.date!;
    List<dynamic>? appointments = details.appointments;
    CalendarElement view = details.targetElement;
    listTaskController.selectedDate = date;
    if (appointments!.length > 0) {
      Navigator.pushNamed(context, LIST_TASKS_PATH);
    } else {
      Navigator.pushNamed(context, MANAGE_TASK_PATH);
    }
    // var dateTest = DateFormat("YYYY-MM-DD").parse()

    print("Date ${date}");
    print("appointments => ${appointments}");
    // print("view => ${view}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Calendar'),
      ),
      body: SfCalendar(
        initialSelectedDate: DateTime.now(),
        view: CalendarView.month,
        showDatePickerButton: true,
        onLongPress: handeLongPress,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(
          showAgenda: true,
          navigationDirection: MonthNavigationDirection.horizontal,
        ),
        headerStyle: CalendarHeaderStyle(
          backgroundColor: Colors.blue,
          textStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
