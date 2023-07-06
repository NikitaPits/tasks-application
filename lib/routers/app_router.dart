import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/routers/simple_route.dart';
import 'package:task_list_app/view/UI/navigation_bar/navigation_wrapper.dart';
import 'package:task_list_app/view/pages/projects/_view/projects_page.dart';
import 'package:task_list_app/view/pages/tasks/_view/tasks_page.dart';
import 'package:task_list_app/view/pages/teams/_view/teams_page.dart';

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
    builder: (context, state, child) =>
        NavigationWrapper(child: child, currentPath: state.fullPath),
  ),
]);
