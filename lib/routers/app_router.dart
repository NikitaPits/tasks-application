import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/navigation_wrapper.dart';
import 'package:task_list_app/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/pages/teams/_view/teams_page.dart';
import 'package:task_list_app/routers/simple_route.dart';

final GoRouter router = GoRouter(routes: [
  ShellRoute(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return TasksPage();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'tasks/:taskNumber',
              name: 'tasks',
              builder: (context, state) => TasksPage(
                taskNumber: state.pathParameters["taskNumber"],
              ),
            ),
            getRoute(route: 'projects', page: ProjectsPage(), name: 'projects'),
            getRoute(route: 'teams', page: TeamsPage(), name: 'teams'),
          ],
        ),
      ],
      builder: (context, state, child) {
        return NavigationWrapper(child: child, currentPath: state.fullPath);
      }),
]);
