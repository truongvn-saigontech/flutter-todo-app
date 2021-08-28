import 'package:get/state_manager.dart';

class ManageTaskController extends GetxController{
  var count = 0.obs;
  increment() => count++;
}