import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/data/model/task.dart';
import 'package:task_list_app/routers/app_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class TasksList extends StateNotifier<List<Task>> {
  final List<Task> tasks;
  TasksList(this.tasks) : super([]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Task list App',
      routerConfig: router,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
