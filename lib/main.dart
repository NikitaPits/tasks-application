import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_list_app/data/model/task.dart';
import 'package:task_list_app/routers/app_router.dart';
import 'package:url_strategy/url_strategy.dart';

final appLocale = StateProvider<Locale>(
  (ref) => Locale('en'),
);
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
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return MaterialApp.router(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          title: 'Task list App',
          locale: ref.watch(appLocale),
          routerConfig: router,
          theme: ThemeData(
            primarySwatch: Colors.indigo,
          ),
        );
      },
    );
  }
}
