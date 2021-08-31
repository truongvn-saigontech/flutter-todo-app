import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:to_do_app/models/task/main.dart';

class ListTaskController extends GetxController {
  RxList<Task> tasks = [
    new Task(
        taskname: "Meeting",
        subtask: "Room 408",
        startTime: "2:30 AM",
        status: Colors.red),
    new Task(
        taskname: "Monthly Report",
        subtask: "Check with quality team",
        startTime: "4:30 AM",
        status: Colors.purple),
    new Task(
        taskname: "Call with Mike",
        subtask: "Discuss about release",
        startTime: "5:00 AM",
        status: Colors.amber),
    new Task(
        taskname: "Update",
        subtask: "Update website with new design",
        startTime: "5:30 PM",
        status: Colors.green),
    new Task(
        taskname: "Email",
        subtask: "Respond to Charles Email",
        startTime: "2:30 PM",
        status: Colors.blue)
  ].obs;

  void handleAddNewTask(Task newTask) {
    tasks.add(newTask);
  }

  void handleDeleteTask(int removeIndex) {
    tasks.removeAt(removeIndex);
  }

  void handleUpdateTask(Task task, int updateIndex) {
    tasks[updateIndex] = task;
  }
}
