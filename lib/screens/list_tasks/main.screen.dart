import 'package:flutter/material.dart';
import 'package:to_do_app/components/header.dart';
import 'package:to_do_app/components/swipe_list.dart';
import 'package:to_do_app/configs/routes/tasks.dart';

class ListTasksScreen extends StatefulWidget {
  ListTasksScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListTasksScreenState createState() => _ListTasksScreenState();
}

class _ListTasksScreenState extends State<ListTasksScreen> {

  void _incrementCounter() {
    Navigator.pushNamed(context, MANAGE_TASK);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Stack(
          children: <Widget>[HeaderWrapper(), SwipeList()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue[200],
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.access_alarm_sharp,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
