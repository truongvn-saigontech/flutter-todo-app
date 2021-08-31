import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/components/colors_picker.dart';
import 'package:to_do_app/components/input_field/main.dart';
import 'package:to_do_app/components/time_select.dart';
import 'package:to_do_app/configs/routes/tasks.dart';
import 'package:to_do_app/helpers/time.helper.dart';
import 'package:to_do_app/models/validate.dart';
import 'package:to_do_app/screens/list_tasks/controller.dart';
import 'package:to_do_app/screens/manage_task/controller.dart';
import 'package:validators/validators.dart' as validator;

class ManageTaskScreen extends StatefulWidget {
  const ManageTaskScreen({Key? key}) : super(key: key);

  @override
  _ManageTaskScreenState createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageTaskScreen> {
  final ManageTaskController manageTaskController =
      Get.put(ManageTaskController());

  ListTaskController listTaskController = Get.put(ListTaskController());
  final _formKey = GlobalKey<FormState>();

  Future<void> handlePressFloatButton(bool isCreateTask) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      int startTimeToHour =
          parseTimeStringToTimeOfDay(manageTaskController.task.value.startTime)
              .hour;
      int endTimeToHour =
          parseTimeStringToTimeOfDay(manageTaskController.task.value.endTime)
              .hour;

      if (startTimeToHour > endTimeToHour) {
        final snackBar =
            SnackBar(content: Text('Invalid range time. Please retry!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        return;
      }

      if (isCreateTask) {
        listTaskController.handleAddNewTask(manageTaskController.task.value);
      } else {
        listTaskController.handleUpdateTask(
          manageTaskController.task.value,
          manageTaskController.updateIndex,
        );
      }

      Navigator.pushNamed(context, LIST_TASKS_PATH);

      manageTaskController.handleResetTask();
    }
  }

  Future<bool> onWillPop() async {
    manageTaskController.handleResetTask();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final bool isCreateTask =
        validator.isNull(manageTaskController.task.value.taskname) &&
            validator.isNull(manageTaskController.task.value.subtask);

    final appBarTitle = isCreateTask ? 'New Task' : 'Edit Task';
    final IconData floatButtonIcon = isCreateTask ? Icons.add : Icons.edit;

    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Obx(
                    () => InputFieldV2(
                      initialValue: manageTaskController.task.value.taskname,
                      labelText: 'Task title',
                      onSaved: (String? value) {
                        manageTaskController.handleChangeTaskField(
                            'taskname', value);
                      },
                      validates: [
                        new Validate(
                          message: 'Please enter task title!',
                          onValidate: validator.isNull,
                          isCondition: true,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Obx(
                    () => InputFieldV2(
                      initialValue: manageTaskController.task.value.subtask,
                      labelText: 'Task sub title',
                      maxLength: 35,
                      onSaved: (String? value) {
                        manageTaskController.handleChangeTaskField(
                            'subtask', value);
                      },
                      validates: [
                        new Validate(
                          message: 'Please enter task sub',
                          onValidate: validator.isNull,
                          isCondition: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Obx(
                    () => TimeSelectV2(
                      isReverse: false,
                      labelText: "Start time",
                      timeSelect: parseTimeStringToTimeOfDay(
                        manageTaskController.task.value.startTime,
                      ),
                      onSelectDate: (TimeOfDay newTime) {
                        manageTaskController.handleChangeTaskField(
                          'startTime',
                          parseTimeOfDayToString(newTime, context),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Obx(
                    () => TimeSelectV2(
                      isReverse: true,
                      labelText: "End time",
                      timeSelect: parseTimeStringToTimeOfDay(
                        manageTaskController.task.value.endTime,
                      ),
                      onSelectDate: (TimeOfDay newTime) {
                        manageTaskController.handleChangeTaskField(
                          'endTime',
                          parseTimeOfDayToString(newTime, context),
                        );
                      },
                    ),
                  ),
                ),
                Obx(
                  () => ColorPicker(
                    colorSelected: manageTaskController.task.value.status,
                    onSelectColor: manageTaskController.handleChangeTaskColor,
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => handlePressFloatButton(isCreateTask),
          tooltip: 'Increment Counter',
          child: Icon(floatButtonIcon),
        ),
      ),
      onWillPop: onWillPop,
    );
  }
}
