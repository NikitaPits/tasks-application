import 'package:flutter/material.dart';
import 'package:task_list_app/data/model/task.dart';
import 'package:task_list_app/utils/date_format.dart';
import 'package:task_list_app/view/UI/text/underlined_title.dart';

class TaskDetailsWidget extends StatelessWidget {
  final Task task;

  const TaskDetailsWidget({super.key, required this.task});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UnderlinedTitleWidget(title: task.title ?? 'Task without title'),
          SizedBox(
            height: 40,
          ),
          Text(
            task.dateTime is DateTime ? formatDateTime(task.dateTime!) : '',
            style: TextStyle(color: Colors.grey[700]),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            task.description ?? '',
            style: TextStyle(color: Colors.grey[900], fontSize: 16),
          ),
        ],
      ),
    );
  }
}
