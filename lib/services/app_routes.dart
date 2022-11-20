import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tasksapp/screens/notes_screen/widgets/add_notes.dart';
import 'package:tasksapp/screens/main_screen/main_screen.dart';
import 'package:tasksapp/screens/notes_screen/notes_screen.dart';
import 'package:tasksapp/screens/recyclebin/recyle_bin.dart';
import 'package:tasksapp/screens/splash/splash_screen.dart';
import 'package:tasksapp/screens/todo_allscreens/tasks_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MainScreen.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: const MainScreen());
      case NotesScreen.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: const NotesScreen());
      case RecycleBin.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: RecycleBin());

      case TasksScreen.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: const TasksScreen());
      case SplashScreen.id:
        return PageTransition(
            type: PageTransitionType.leftToRight, child: const SplashScreen());
      case CreateNoteScreen.id:
        return PageTransition(
            type: PageTransitionType.leftToRight,
            child: const CreateNoteScreen());

      default:
        return null;
    }
  }
}
