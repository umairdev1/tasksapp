import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';
import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/screens/todo_allscreens/widgets/add_tasks.dart';
import 'package:tasksapp/screens/recyclebin/recyle_bin.dart';
import 'package:tasksapp/screens/todo_allscreens/widgets/completed_tasks.dart';
import 'package:tasksapp/screens/todo_allscreens/widgets/pending_task.dart';
import 'package:tasksapp/utilities/colors.dart';
import 'package:tasksapp/utilities/constants.dart';
import 'package:tasksapp/widgets/appbar.dart';
import 'package:tasksapp/widgets/drawer.dart';

import '../../blocs/bloc_exports.dart';
import '../../widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  static const id = '/';
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  bool pending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Todo',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TodoChip(
                    icon: Icons.pending_actions,
                    title: 'Pending Tasks',
                    active: pending ? true : false,
                    press: () {
                      setState(() {
                        pending = true;
                      });
                    }),
                TodoChip(
                    icon: Icons.done_all_rounded,
                    title: 'Completed Tasks',
                    active: pending ? false : true,
                    press: () {
                      setState(() {
                        pending = false;
                      });
                    })
              ],
            ),
            SizedBox(
              height: 10,
            ),
            pending ? PendingTasksScreen() : CompletedTasksScreen(),
          ],
        ),
      ),
    );
  }
}

class TodoChip extends StatelessWidget {
  final String title;
  final bool active;
  final VoidCallback press;
  final IconData icon;
  const TodoChip({
    Key? key,
    required this.title,
    required this.active,
    required this.press,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, state) {
        return InkWell(
          onTap: press,
          child: Chip(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            backgroundColor: state.switchValue ? null : kwhiteColor,
            avatar: Icon(
              icon,
              color: active ? kprimaryColor : Colors.grey,
            ),
            label: Text(
              title,
              style: TextStyle(
                color: active ? kprimaryColor : Colors.grey,
              ),
            ),
          ),
        );
      },
    );
  }
}
