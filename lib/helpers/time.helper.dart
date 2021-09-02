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

String parseDateTimeToTimeOfDayString(DateTime date) {
  return DateFormat("h:mm a").format(date);
}

String getMonthName(int monthNumber) {
  const MONTHS_NAME = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  return MONTHS_NAME[monthNumber - 1];
}

String getDateFormatYYMMDD(DateTime date) {
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');
  return outputFormat.format(date); 
}
