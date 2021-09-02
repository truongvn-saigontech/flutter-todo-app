import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_app/helpers/time.helper.dart';
import 'package:to_do_app/models/color_serializer.model.dart';
import 'package:to_do_app/models/datetime_serializer.dart';
import 'package:to_do_app/models/task/task.dart';

part 'calendar.g.dart';

enum TaskTimeType { startTime, endTime }

@JsonSerializable()
class CalendarV2 {
  CalendarV2({
    required this.eventName,
    required this.from,
    required this.to,
    required this.background,
    required this.isAllDay,
    this.subTask
  });

  String eventName;
  String? subTask;

  @DateTimeSerializer()
  DateTime from;

  @DateTimeSerializer()
  DateTime to;

  @ColorSerialiser()
  Color background;

  bool isAllDay;

  factory CalendarV2.fromJson(Map<String, dynamic> json) =>
      _$CalendarV2FromJson(json);

  Map<String, dynamic> toJson() => _$CalendarV2ToJson(this);

  Task toTask(CalendarV2 calendar) {
    return Task(
      taskname: calendar.eventName,
      startTime: parseDateTimeToTimeOfDayString(calendar.from),
      status: calendar.background,
      subtask: calendar.subTask as String,
    );
  }
}
