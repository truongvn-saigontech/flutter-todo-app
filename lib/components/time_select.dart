import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';

class TimeSelectV2 extends StatefulWidget {
  const TimeSelectV2({Key? key}) : super(key: key);

  @override
  _TimeSelectV2State createState() => _TimeSelectV2State();
}

class _TimeSelectV2State extends State<TimeSelectV2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
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
                          " 20:00",
                          style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "  Select time",
                style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ],
          ),
        ),
        // color: Colors.white,
      ),
    );
  }
}
