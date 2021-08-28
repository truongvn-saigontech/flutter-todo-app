import 'package:flutter/material.dart';
// import 'package:validators/validators.dart' as validator;

class Model {
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  Model({this.firstName, this.lastName, this.email, this.password});
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // initialValue: 'Task title',
      maxLength: 20,
      decoration: InputDecoration(
        labelText: 'Task title',
        // errorText: 'Error message',
        border: OutlineInputBorder(),
        suffixIcon: Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
    );
  }
}