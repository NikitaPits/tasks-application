import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_list_app/navigation_wrapper.dart';

getRoute({required String route, required Widget page}) {
  return GoRoute(
    path: route,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: NavigationWrapper(child: page),
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
