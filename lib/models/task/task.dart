import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_app/helpers/time.helper.dart';
import 'package:to_do_app/models/calendar/calendar.dart';
import 'package:to_do_app/models/color_serializer.model.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  String taskname, subtask, startTime;
  String? endTime, date;

  String? id;

  @ColorSerialiser()
  Color status;

  Task(
      {required this.taskname,
      required this.subtask,
      required this.startTime,
      this.date,
      this.endTime = '',
      this.id,
      required this.status}) {
    this.id = Uuid().v4();
    this.date = DateFormat("yyyy-MM-dd").format(DateTime.now());
  }

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  Task copyWith(
      {String? taskname,
      String? subtask,
      String? startTime,
      String? date,
      Color? status,
      String? endTime}) {
    return Task(
        taskname: taskname ?? this.taskname,
        subtask: subtask ?? this.subtask,
        startTime: startTime ?? this.startTime,
        date: date ?? this.date,
        status: status ?? this.status,
        endTime: endTime ?? this.endTime);
  }

  bool isNull() {
    return isCheckClassNull(this.toJson());
  }

  CalendarV2 toCaledar() {
    return CalendarV2(
      background: this.status,
      from: this.getTimeFromTask(this, TaskTimeType.startTime),
      eventName: this.taskname,
      isAllDay: false,
      to: this.getTimeFromTask(
        this,
        TaskTimeType.endTime,
      ),
    );
  }

  @protected
  DateTime getTimeFromTask(Task task, TaskTimeType taskTimeType) {
    String? getTimeFromTask =
        taskTimeType == TaskTimeType.endTime ? task.endTime : task.startTime;

    TimeOfDay timeParsed = parseTimeStringToTimeOfDay(getTimeFromTask);
    DateTime dateParsed = DateTime.parse(task.date as String);

    return DateTime(
      dateParsed.year,
      dateParsed.month,
      dateParsed.month,
      dateParsed.day,
      timeParsed.hour,
      timeParsed.minute,
    );
  }
}

bool isCheckClassNull<T extends Map<String, dynamic>>(T classToCheck) {
  bool result = true;

  classToCheck.forEach((key, value) {
    if (![value].contains(null)) {
      result = false;
    }
  });

  return result;
}
