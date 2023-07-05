import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/home_page.dart';
import 'package:task_list_app/utils/navigator/simple_route.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage(page: 'tasks');
      },
      routes: <RouteBase>[
        getRoute(route: 'tasks'),
        getRoute(route: 'projects'),
        getRoute(route: 'teams'),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Task list App',
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
    );
  }
}
