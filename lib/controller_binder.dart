import 'package:get/get.dart';
import 'package:task_manager/ui/controllers/cancelled_task_list_controller.dart';
import 'package:task_manager/ui/controllers/completed_task_list_controller.dart';
import 'package:task_manager/ui/controllers/get_otp_controller.dart';
import 'package:task_manager/ui/controllers/new_task_list_controller.dart';
import 'package:task_manager/ui/controllers/progress_task_list_controller.dart';
import 'package:task_manager/ui/controllers/reset_password_controller.dart';
import 'package:task_manager/ui/controllers/sign_in_controller.dart';
import 'package:task_manager/ui/controllers/signup_controller.dart';
import 'package:task_manager/ui/controllers/update_profile_controller.dart';
import 'package:task_manager/ui/controllers/verify_otp_controller.dart';
class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(SignupController());
    Get.put(GetOtpController());
    Get.put(VerifyOtpController());
    Get.put(ResetPasswordController());
    Get.put(UpdateProfileController());
    Get.put(NewTaskListController());
    Get.put(ProgressTaskListController());
    Get.put(CompletedTaskListController());
    Get.put(CancelledTaskListController());
  }
}