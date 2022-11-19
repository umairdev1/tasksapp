import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tasksapp/screens/recyle_bin.dart';
import 'package:tasksapp/screens/splash_screen.dart';
import 'package:tasksapp/screens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RecycleBin.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: const RecycleBin());

      case TasksScreen.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: const TasksScreen());
      case SplashScreen.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: const SplashScreen());

      default:
        return null;
    }
  }
}
