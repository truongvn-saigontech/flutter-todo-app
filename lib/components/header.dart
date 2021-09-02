import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:to_do_app/helpers/time.helper.dart';
import 'package:to_do_app/screens/list_tasks/list_tasks.controller.dart';

class HeaderWrapper extends StatelessWidget {
  const HeaderWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 4,
        child: HeaderContent(),
        decoration: BoxDecoration(
          color: Color(0xff5a348b),
          gradient: LinearGradient(
            colors: [Color(0xff8d70fe), Color(0xff2da9ef)],
            begin: Alignment.centerRight,
            end: Alignment(-1.0, -1.0),
          ),
        ),
      ),
    );
  }
}

class HeaderContent extends StatefulWidget {
  HeaderContent({Key? key}) : super(key: key);

  @override
  _HeaderContentState createState() => _HeaderContentState();
}

class _HeaderContentState extends State<HeaderContent> {
  ListTaskController listTaskController = Get.put(ListTaskController());

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ListTile(
        leading: Text(
          listTaskController.selectedDate.day.toString(),
          style: TextStyle(fontSize: 50.0, color: Colors.amber),
        ),
        title: Text(getMonthName(listTaskController.selectedDate.month),
            style: TextStyle(fontSize: 34.0, color: Colors.white)),
        subtitle: Text(listTaskController.selectedDate.year.toString(),
            style: TextStyle(fontSize: 24.0, color: Colors.white)),
      ),
    );
  }
}
