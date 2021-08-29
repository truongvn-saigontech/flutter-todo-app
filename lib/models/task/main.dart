import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_app/models/color_serializer.model.dart';

part 'main.g.dart';

@JsonSerializable()
class Task {
  String taskname, subtask, tasktime;

  @ColorSerialiser()
  Color status;

  Task(
      {required this.taskname,
      required this.subtask,
      required this.tasktime,
      required this.status});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  Task copyWith(
      {String? taskname, String? subtask, String? tasktime, Color? status}) {
    return Task(
      taskname: taskname ?? this.taskname,
      subtask: subtask ?? this.subtask,
      tasktime: tasktime ?? this.tasktime,
      status: status ?? this.status,
    );
  }
}
