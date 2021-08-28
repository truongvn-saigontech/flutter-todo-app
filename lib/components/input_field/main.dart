import 'package:flutter/material.dart';
import 'package:to_do_app/models/validate.dart';

class InputFieldV2 extends StatefulWidget {
  final dynamic Function(String) onSaved;
  final List<Validate> validates;

  final bool? isValidField;
  final String? initialValue;
  final String? labelText;
  final int? maxLength;

  const InputFieldV2(
      {Key? key,
      this.isValidField,
      this.labelText,
      required this.validates,
      required this.onSaved,
      this.maxLength = 20,
      this.initialValue = ''})
      : super(key: key);

  @override
  _InputFieldV2State createState() => _InputFieldV2State();
}

class _InputFieldV2State extends State<InputFieldV2> {
  bool? isCheckValidate;
  Color handleCheckColor() {
    if (isCheckValidate == null) return Colors.grey;
    if (isCheckValidate as bool) return Colors.blue;
    return Colors.red;
  }

  IconData handleCheckIcon() {
    if (isCheckValidate == null) return Icons.error;
    if (isCheckValidate as bool) return Icons.done;
    return Icons.error;
  }

  String? handleValidator(String? value) {
    for (Validate validate in widget.validates) {
      if (validate.onValidate(value) == validate.isCondition) {
        setState(() {
          isCheckValidate = false;
        });
        return validate.message;
      }
    }

    setState(() {
      isCheckValidate = true;
    });
    return null;
  }

  OutlineInputBorder renderOutline() {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: handleCheckColor(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      maxLength: widget.maxLength,
      validator: handleValidator,
      onSaved: (value) {
        print(value);
        print(context);
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: renderOutline(),
        border: renderOutline(),
        suffixIcon: Icon(
          handleCheckIcon(),
          color: handleCheckColor(),
        ),
      ),
    );
  }
}
