import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:to_do_app/models/color_serializer.model.dart';

part 'main.g.dart';

@JsonSerializable()
class Task {
  String taskname, subtask, tasktime;

  @ColorSerialiser()
  final Color status;

  Task(this.taskname, this.subtask, this.tasktime, this.status);

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
