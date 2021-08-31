import 'dart:ui';
import 'package:validators/validators.dart' as validator;
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_app/models/color_serializer.model.dart';
// import 'package:uuid/uuid.dart';

part 'main.g.dart';

@JsonSerializable()
class Task {
  String taskname, subtask, startTime;
  String? endTime;

  String? id;

  @ColorSerialiser()
  Color status;

  Task(
      {required this.taskname,
      required this.subtask,
      required this.startTime,
      this.endTime = '',
      this.id,
      required this.status});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  Task copyWith(
      {String? taskname,
      String? subtask,
      String? startTime,
      Color? status,
      String? endTime}) {
    return Task(
        taskname: taskname ?? this.taskname,
        subtask: subtask ?? this.subtask,
        startTime: startTime ?? this.startTime,
        status: status ?? this.status,
        endTime: endTime ?? this.endTime);
  }

  bool isNull() {
    return isCheckClassNull(this.toJson());
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