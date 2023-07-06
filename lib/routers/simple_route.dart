import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

getRoute({required String route, String? name, required Widget page}) {
  return GoRoute(
    path: route,
    name: name,
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: page,
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
