import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/data/model/task.dart';

final networkServiceProvider = FutureProvider<List<Task>>((ref) {
  return NetworkService().getTasks();
});

class NetworkService {
  NetworkService();
  final String _lorem =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
  Future<List<Task>> getTasks() async {
    final now = DateTime.now();
    return [
      Task(
          id: '1',
          title: 'Read emails from mailbox',
          dateTime: now,
          description: _lorem),
      Task(
          id: '2',
          title: 'Check latest news on Flutter',
          dateTime: now,
          description: _lorem),
      Task(
          id: '3',
          title: 'Have a call with Flutter team',
          dateTime: now,
          description: _lorem),
      Task(
          id: '4',
          title: 'Work on application performance',
          dateTime: now,
          description: _lorem),
      Task(
          id: '5',
          title: 'Plan work for next week',
          dateTime: now,
          description: _lorem),
      Task(id: '6', title: 'Order lunch', dateTime: now, description: _lorem),
      Task(
          id: '7',
          title: 'Create an invoice for last month',
          dateTime: now,
          description: _lorem),
    ];
  }
}
