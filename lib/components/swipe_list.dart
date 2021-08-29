import 'package:flutter/material.dart';
import 'package:to_do_app/configs/routes/tasks.dart';
import 'package:to_do_app/models/task/main.dart';

List<Task> tasks = List.from([
  new Task(
      taskname: "Meeting",
      subtask: "Room 408",
      tasktime: "12:30",
      status: Colors.red),
  new Task(
      taskname: "Monthly Report",
      subtask: "Check with quality team",
      tasktime: "14:30",
      status: Colors.purple),
  new Task(
      taskname: "Call with Mike",
      subtask: "Discuss about release",
      tasktime: "15:00",
      status: Colors.amber),
  new Task(
      taskname: "Update",
      subtask: "Update website with new design",
      tasktime: "15:30",
      status: Colors.green),
  new Task(
      taskname: "Email",
      subtask: "Respond to Charles Email",
      tasktime: "16:30",
      status: Colors.blue)
]);

class SwipeList extends StatelessWidget {
  SwipeList({Key? key}) : super(key: key);

  static const double GUTTER = 15;

  void handleDismisItem(DismissDirection direction, int index) {
    print(direction);
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 4,
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 1.5 - GUTTER,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              confirmDismiss: (DismissDirection direction) =>
                  handleConfirmDismiss(direction, context),
              key: Key(index.toString()),
              secondaryBackground: Container(
                color: tasks[index].status,
                child: IconDissmissible(
                  icon: Icons.edit_outlined,
                  alignment: MainAxisAlignment.end,
                ),
              ),
              onDismissed: (DismissDirection direction) =>
                  handleDismisItem(direction, index),
              background: Container(
                color: Colors.orangeAccent,
                child: IconDissmissible(
                  icon: Icons.remove_circle_outlined,
                  alignment: MainAxisAlignment.start,
                ),
              ),
              child: ListItemContainer(
                index: index,
                task: tasks[index],
              ),
            );
          },
        ),
      ),
    );
  }

  bool get newMethod => false;

  Future<bool> handleConfirmDismiss(
      DismissDirection direction, BuildContext context) async {
    if (direction == DismissDirection.endToStart) {
      Navigator.pushNamed(context, MANAGE_TASK, arguments: '12431');
      // Navigator.push(context, MaterialPageRoute(builder: (context) => ManageTaskScreen(task)))
      return false;
    }

    return true;
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
      children: [
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
                              task.tasktime,
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
