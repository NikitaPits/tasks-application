import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/home_page.dart';

getRoute({required String route}) {
  return GoRoute(
    path: route,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: HomePage(page: route),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
  );
}
