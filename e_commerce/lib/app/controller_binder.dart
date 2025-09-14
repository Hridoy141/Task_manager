import 'package:e_commerce/featues/shared/presentation/controllers/main_nav_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavController());
  }

}