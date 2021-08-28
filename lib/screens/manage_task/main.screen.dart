import 'package:flutter/material.dart';
import 'package:to_do_app/components/input_field/main.dart';
import 'package:to_do_app/components/time_select.dart';
import 'package:to_do_app/models/task/main.dart';
import 'package:to_do_app/models/validate.dart';
import 'package:validators/validators.dart' as validator;

class ManageTaskScreen extends StatefulWidget {
  const ManageTaskScreen({Key? key}) : super(key: key);

  @override
  _ManageTaskScreenState createState() => _ManageTaskScreenState();
}

class _ManageTaskScreenState extends State<ManageTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  Task task = new Task("", "", "", Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
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
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: InputFieldV2(
                  initialValue: task.taskname,
                  labelText: 'Task title',
                  onSaved: (String value) {
                    task.taskname = value;
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
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: InputFieldV2(
                  initialValue: task.subtask,
                  labelText: 'Task sub title',
                  maxLength: 35,
                  onSaved: (String value) {
                    task.subtask = value;
                  },
                  validates: [
                    new Validate(
                        message: 'Please enter task sub',
                        onValidate: validator.isNull,
                        isCondition: true)
                  ],
                ),
              ),
              TimeSelectV2()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          if (_formKey.currentState!.validate())
            {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              )
            }
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
