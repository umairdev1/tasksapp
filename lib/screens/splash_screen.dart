import 'package:flutter/material.dart';
import 'package:tasksapp/screens/tasks_screen.dart';
import 'package:tasksapp/utilities/colors.dart';

class SplashScreen extends StatelessWidget {
  static const id = 'splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, TasksScreen.id);
    });
    return Scaffold(
      backgroundColor: kwhiteColor,
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
  }
}
