import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:to_do_app/configs/routes/tasks.dart';
import 'package:to_do_app/screens/calendar/data.example.dart';
import 'package:validators/sanitizers.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Calendar> _getDataSource() {
    final List<Calendar> meetings = <Calendar>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.addAll([
      Calendar('Conference', startTime, endTime, const Color(0xFF0F8644), false),
      Calendar('New', startTime, endTime, Colors.red, false),
      Calendar('Meeting with John', startTime, endTime, Colors.blue, false),
    ]);
    return meetings;
  }

  void handeLongPress(CalendarLongPressDetails details) {
    DateTime date = details.date!;
    List<dynamic>? appointments = details.appointments;
    CalendarElement view = details.targetElement;
    if (appointments!.length > 0) {
      Navigator.pushNamed(context, LIST_TASKS_PATH);
    } else {
      Navigator.pushNamed(context, MANAGE_TASK_PATH);
    }
    print("Date ${date}");
    print("appointments => ${appointments}");
    print("view => ${view}");
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
        headerStyle: CalendarHeaderStyle(
          backgroundColor: Colors.blue,
          textStyle: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        showDatePickerButton: true,
        onLongPress: handeLongPress,
        dataSource: MeetingDataSource(_getDataSource()),
        monthViewSettings: MonthViewSettings(
            showAgenda: true,
            navigationDirection: MonthNavigationDirection.horizontal
            // appointmentDisplayCount: 2,
            ),
      ),
    );
  }
}
