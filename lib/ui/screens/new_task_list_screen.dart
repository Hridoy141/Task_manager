import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/urls.dart';
import 'package:task_manager/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';
import '../widgets/task_card.dart';
import '../widgets/task_count_summary_card.dart';
import 'add_new_task_screen.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  bool _getNewTaskInProgress = false;
  List<TaskModel> _newTaskList = [];

  @override
  void initState() {
    super.initState();
    _getNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            const SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TaskCountSummaryCard(title: 'Progress', count: 12);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 4),
              ),
            ),
            Expanded(
              child: Visibility(
                visible:  _getNewTaskInProgress == false,
                replacement: CenteredCircularProgressIndicator(),
                child: ListView.builder(
                  itemCount: _newTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskCard(taskType: TaskType.tNew,
                      taskModel: _newTaskList[index],
                    );

                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTaskButton,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _getNewTaskList() async {
    _getNewTaskInProgress = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urls.getNewTaskUrl,
    );
    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _newTaskList = list;
    } else {
      showSnackBarMessage(context, response.errorMessage!);
    }
    _getNewTaskInProgress = false;
    setState(() {});
  }

  void _onTapAddNewTaskButton() {
    Navigator.pushNamed(context, AddNewTaskScreen.name);
  }
}
