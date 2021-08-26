import 'dart:ui';
import 'package:flutter/material.dart';

class TaskModel {
  final String taskname, subtask, tasktime;

  final Color status;

  TaskModel(this.taskname, this.subtask, this.tasktime, this.status);
}
