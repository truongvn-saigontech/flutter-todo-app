import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ObxWrapper extends StatefulWidget {
  final dynamic content;
  const ObxWrapper(this.content);

  @override
  _ObxWrapperState createState() => _ObxWrapperState();
}

class _ObxWrapperState extends State<ObxWrapper> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => widget.content);
  }
}
