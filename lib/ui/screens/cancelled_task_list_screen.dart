import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';

import '../../data/models/task_model.dart';
import '../../data/service/network_caller.dart';
import '../../data/urls.dart';
import '../widgets/snack_bar_message.dart';
import '../widgets/task_card.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() => _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {

  bool _getCancelledTaskInProgress = false;
  List<TaskModel> _cancelledTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCancelledTaskList();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8 ),
      child: Visibility(
        visible: _getCancelledTaskInProgress == false,
        replacement: CenteredCircularProgressIndicator(),
        child: ListView.builder(
          itemCount: _cancelledTaskList.length,
          itemBuilder: (context, index) {
            return TaskCard(
              taskType: TaskType.cancelled,
              taskModel: _cancelledTaskList[index], onStatusUpdate: () {
                _getCancelledTaskList();
            },
            );
          },
        ),
      ),
    );
  }

  Future<void> _getCancelledTaskList() async {
    _getCancelledTaskInProgress = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getNewTaskUrl,
    );
    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _cancelledTaskList = list;
    } else {
      showSnackBarMessage(context, response.errorMessage!);
    }
    _getCancelledTaskInProgress = false;
    setState(() {});
  }

}
