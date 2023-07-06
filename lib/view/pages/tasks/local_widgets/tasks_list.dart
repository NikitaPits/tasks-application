import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/data/model/task.dart';
import 'package:task_list_app/view/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/view/pages/tasks/local_widgets/task_list_tile.dart';

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
        return Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return GestureDetector(
              onTap: () {
                pageController.jumpToPage(index);
                ref.read(currentTaskPage.notifier).update((state) => index);
                context.goNamed('tasks',
                    pathParameters: {'taskNumber': (index + 1).toString()});
              },
              child: TaskListTile(
                  task: task,
                  highlighted: ref.watch(currentTaskPage) == index));
        });
      },
    );
  }
}
