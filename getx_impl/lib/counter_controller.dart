import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CounterController extends GetxController {
  int _count = 0;

  int get count => _count;
  void increment() {
    _count++;
    update();
  }

  void decrement() {
    if( count <= 0) {
      return;
    }
    _count--;
    update();
  }
}