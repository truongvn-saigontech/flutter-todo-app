import 'package:flutter/material.dart';
import 'package:to_do_app/configs/routes/tasks.dart';
import 'package:to_do_app/models/task.model.dart';

List<TaskModel> tasks = List.from([
  new TaskModel("Meeting", "Room 408", "12:30", Colors.red),
  new TaskModel(
      "Monthly Report", "Check with quality team", "14:30", Colors.purple),
  new TaskModel(
      "Call with Mike", "Discuss about release", "15:00", Colors.amber),
  new TaskModel(
      "Update", "Update website with new design", "15:30", Colors.green),
  new TaskModel("Email", "Respond to Charles Email", "16:30", Colors.blue)
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
      Navigator.pushNamed(context, MANAGE_TASK);
    }

    return false;
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
  final TaskModel task;

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
