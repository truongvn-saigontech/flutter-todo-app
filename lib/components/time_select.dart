import 'package:flutter/material.dart';

class TimeSelectV2 extends StatefulWidget {
  final TimeOfDay timeSelect;
  final String labelText;
  final bool isReverse;
  final Function(TimeOfDay) onSelectDate;
  const TimeSelectV2(
      {Key? key,
      required this.timeSelect,
      required this.onSelectDate,
      this.isReverse = false,
      required this.labelText})
      : super(key: key);

  @override
  _TimeSelectV2State createState() => _TimeSelectV2State();
}

class _TimeSelectV2State extends State<TimeSelectV2> {
  final TimeOfDay initialTime =
      TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute);

  List<Widget> renderTimeSelectContent() {
    List<Widget> view = <Widget>[
      Row(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.access_time,
                  size: 20.0,
                  color: Colors.white,
                ),
                Text(
                  " ${widget.timeSelect.format(context)}",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
      Text(
        "  ${widget.labelText}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    ];

    return widget.isReverse ? view.reversed.toList() : view;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: handleSelectTime,
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: renderTimeSelectContent(),
          ),
        ),
        // color: Colors.white,
      ),
    );
  }

  Future<void> handleSelectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: widget.timeSelect,
    );
    widget.onSelectDate(newTime ?? initialTime);
  }
}
