import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/navigation_wrapper.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';
import 'package:task_list_app/routers/simple_route.dart';

final GoRouter router = GoRouter(routes: [
  ShellRoute(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return TasksPage();
      },
      routes: <RouteBase>[
        getRoute(route: "tasks/:taskNumber", page: TasksPage(), name: 'tasks'),
        getRoute(route: 'projects', page: ProjectsPage()),
        getRoute(route: 'teams', page: TeamsPage()),
      ],
    ),
  ], builder: (context, state, child) => NavigationWrapper(child: child)),
]);
