import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/UI/text/underlined_title.dart';
import 'package:task_list_app/pages/tasks/local_widgets/task_details.dart';
import 'package:task_list_app/pages/tasks/local_widgets/tasks_list.dart';
import 'package:task_list_app/service/network_service.dart';

final currentTaskPage = StateProvider<int>((ref) => 0);

class TasksPage extends ConsumerStatefulWidget {
  final String? taskNumber;
  const TasksPage({
    Key? key,
    this.taskNumber,
  }) : super(key: key);
  TasksPageState createState() => TasksPageState();
}

class TasksPageState extends ConsumerState<TasksPage> {
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    pageController = PageController(
        initialPage: widget.taskNumber != null
            ? (int.parse(widget.taskNumber!) - 1)
            : ref.read(currentTaskPage));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.taskNumber != null
          ? ref
              .read(currentTaskPage.notifier)
              .update((s) => (int.parse(widget.taskNumber!) - 1))
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(networkServiceProvider);

    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  UnderlinedTitleWidget(title: 'Tasks'),
                  tasks.when(data: (data) {
                    return Expanded(
                        child: TaskListView(
                            tasks: data, pageController: pageController));
                  }, error: (Object error, StackTrace stackTrace) {
                    return Center(child: Text('Loading failed'));
                  }, loading: () {
                    return CircularProgressIndicator();
                  }),
                ],
              ),
            ),
          ),
          Container(
            width: 2,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[300],
          ),
          Expanded(
            child: tasks.when(data: (data) {
              return PageView(
                controller: pageController,
                children: [
                  ...data.map((task) => TaskDetailsWidget(task: task))
                ],
              );
            }, error: (Object error, StackTrace stackTrace) {
              return Center(child: Text('Loading failed'));
            }, loading: () {
              return CircularProgressIndicator();
            }),
          ),
        ],
      ),
    );
  }
}
