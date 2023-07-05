import 'package:flutter/material.dart';
import 'package:task_list_app/pages/tasks/local_widgets/task_details.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            // TODO: labels should be in app localization file
            child: Text('Tasks'),
          ),
          Container(
            width: 2,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey[300],
          ),
          TaskDetailsWidget(),
        ],
      ),
    );
  }
}
