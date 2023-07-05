import 'package:flutter/material.dart';
import 'package:task_list_app/data/model/task.dart';
import 'package:task_list_app/pages/tasks/local_widgets/task_list_tile.dart';

class TaskListView extends StatelessWidget {
  final PageController pageController;
  final List<Task> tasks;

  const TaskListView({required this.tasks, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return GestureDetector(
            onTap: () {
              pageController.jumpToPage(index);
            },
            child: TaskListTile(task: task));
      },
    );
  }
}
