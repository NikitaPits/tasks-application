import 'package:flutter/material.dart';
import 'package:task_list_app/data/model/task.dart';
import 'package:task_list_app/utils/date_format.dart';

class TaskListTile extends StatelessWidget {
  final Task task;

  const TaskListTile({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      height: 50,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            task.title ?? '',
            style: TextStyle(fontSize: 16),
          ),
          Text(task.dateTime is DateTime ? formatDateTime(task.dateTime!) : ''),
        ],
      ),
    );
  }
}
