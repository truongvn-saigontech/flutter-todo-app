import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:to_do_app/configs/routes/tasks.dart';
import 'package:to_do_app/models/task/task.dart';
import 'package:to_do_app/screens/list_tasks/list_tasks.controller.dart';
import 'package:to_do_app/screens/manage_task/manage_task.controller.dart';

class SwipeList extends StatefulWidget {
  final List<Task> dataSource;
  SwipeList({Key? key, required this.dataSource}) : super(key: key);

  static const double GUTTER = 15;

  @override
  _SwipeListState createState() => _SwipeListState();
}

class _SwipeListState extends State<SwipeList> {
  ListTaskController listTaskController = Get.put(ListTaskController());
  ManageTaskController manageTaskController = Get.put(ManageTaskController());

  void handleDismisItem(DismissDirection direction, int index) {
    if (direction == DismissDirection.startToEnd) {
      listTaskController.handleDeleteTask(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5 - SwipeList.GUTTER,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: widget.dataSource.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              onDismissed: (DismissDirection dismissDirection) =>
                  handleDismisItem(dismissDirection, index),
              confirmDismiss: (DismissDirection direction) =>
                  handleConfirmDismiss(direction, context, index),
              key: Key(index.toString()),
              secondaryBackground: Container(
                color: widget.dataSource[index].status,
                child: IconDissmissible(
                  icon: Icons.edit_outlined,
                  alignment: MainAxisAlignment.end,
                ),
              ),
              background: Container(
                color: Colors.orangeAccent,
                child: IconDissmissible(
                  icon: Icons.remove_circle_outlined,
                  alignment: MainAxisAlignment.start,
                ),
              ),
              child: ListItemContainer(
                index: index,
                task: widget.dataSource[index],
              ),
            );
          },
        ),
      ),
    );
  }

  bool get newMethod => false;

  Future<bool?> handleConfirmDismiss(
      DismissDirection direction, BuildContext context, int index) async {
    if (direction == DismissDirection.endToStart) {
      manageTaskController
          .handleAssignTask(listTaskController.tasks.toJson()[index]);
      Navigator.pushNamed(context, MANAGE_TASK_PATH);
      return false;
    }
  }
}

class IconDissmissible extends StatelessWidget {
  final IconData icon;
  final MainAxisAlignment alignment;
  const IconDissmissible(
      {Key? key, required this.icon, required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Icon(
            icon,
            size: 35.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ListItemContainer extends StatelessWidget {
  final int index;
  final Task task;

  const ListItemContainer({Key? key, required this.index, required this.task})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 10,
        child: Material(
          elevation: 14.0,
          shadowColor: Color(0x802196F3),
          child: Container(
            child: Row(
              children: <Widget>[
                Container(
                  width: 10.0,
                  height: double.infinity,
                  color: task.status,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                task.taskname,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            Text(
                              task.startTime,
                              style: TextStyle(color: Colors.black45),
                            )
                          ],
                        ),
                        Text(
                          task.subtask,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blueAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
