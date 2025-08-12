import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';

import '../controllers/progress_task_list_controller.dart';

import '../widgets/task_card.dart';
import 'package:get/get.dart';
class ProgressTaskListScreen extends StatefulWidget {
  const ProgressTaskListScreen({super.key});

  @override
  State<ProgressTaskListScreen> createState() => _ProgressTaskListScreenState();
}

class _ProgressTaskListScreenState extends State<ProgressTaskListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProgressTaskListController>().getProgressTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GetBuilder<ProgressTaskListController>(
          builder: (controller) {
            return Visibility(
              visible: controller.inProgress == false,
              replacement: CenteredCircularProgressIndicator(),
              child: ListView.builder(
                itemCount: controller.progressTaskList.length,
                itemBuilder: (context, index) {
                  return TaskCard(
                    taskType: TaskType.progress,
                    taskModel: controller.progressTaskList[index],
                    onStatusUpdate: () {
                      Get.find<ProgressTaskListController>()
                          .getProgressTaskList();
                    },
                  );
                },
              ),
            );
          }
      ),
    );
  }
}