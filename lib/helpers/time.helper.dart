import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

TimeOfDay initialTime =
    TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);

TimeOfDay parseTimeStringToTimeOfDay(String? timeString) {
  if (timeString == null || timeString.isEmpty) return initialTime;

  return TimeOfDay.fromDateTime(DateFormat.jm().parse(timeString));
}

String parseTimeOfDayToString(TimeOfDay timeOfDay, BuildContext context) {
  return timeOfDay.format(context);
}
