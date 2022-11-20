import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';
import 'package:tasksapp/screens/main_screen/main_screen.dart';
import 'package:tasksapp/screens/todo_allscreens/tasks_screen.dart';
import 'package:tasksapp/utilities/colors.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, MainScreen.id);
    });
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.switchValue ? null : kwhiteColor,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/book.png',
                  height: 80,
                ),
                SizedBox(
                  height: 5,
                ),
                Text("SgNotes")
              ],
            ),
          ),
        );
      },
    );
  }
}
