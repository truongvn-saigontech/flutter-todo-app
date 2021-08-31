import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/helpers/time.helper.dart';
import 'package:to_do_app/models/task/main.dart';

class ManageTaskController extends GetxController {
  int updateIndex = -1;
  Rx<Task> task = new Task(
          taskname: "",
          startTime: '',
          endTime: '',
          status: Colors.red,
          subtask: "")
      .obs;

  void handleChangeTaskField<T>(String fieldName, T value) {
    Color tempColor = task.value.status;

    var taskJson = task.value.copyWith().toJson();
    taskJson[fieldName] = value;
    task.value = Task.fromJson(taskJson);

    task.value.status = tempColor;
    refresh();
  }

  void handleChangeTaskColor(Color color) {
    task.update((val) {
      val?.status = color;
    });
  }

  void handleAssignTask(Task anotherTask) {
    task.value = anotherTask;
    refresh();
  }

  Future<void> handleResetTask() async {
    task.value = new Task(
      taskname: "",
      startTime: '',
      endTime: '',
      status: Colors.red,
      subtask: "",
    );
  }
}
