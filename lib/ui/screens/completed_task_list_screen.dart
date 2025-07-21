import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';

import '../../data/models/task_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/urls.dart';
import '../widgets/snack_bar_message.dart';
import '../widgets/task_card.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() => _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {

  bool _getCompletedTaskInCompleted = false;
  List<TaskModel> _completedTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCompletedTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8 ),
      child: Visibility(
        visible: _getCompletedTaskInCompleted == false,
        replacement: CenteredCircularProgressIndicator(),
        child: ListView.builder(
          itemCount: _completedTaskList.length,
          itemBuilder: (context, index) {
             return TaskCard(
               taskType: TaskType.completed,
               taskModel: _completedTaskList[index],
             );
          },
        ),
      ),
    );
  }
  Future<void> _getCompletedTaskList() async {
    _getCompletedTaskInCompleted = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getNewTaskUrl,
    );
    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _completedTaskList = list;
    } else {
      showSnackBarMessage(context, response.errorMessage!);
    }
    _getCompletedTaskInCompleted = false;
    setState(() {});
  }

}
