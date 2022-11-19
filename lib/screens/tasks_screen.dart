import 'package:flutter/material.dart';
import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/screens/add_tasks.dart';
import 'package:tasksapp/screens/recyle_bin.dart';
import 'package:tasksapp/utilities/colors.dart';
import 'package:tasksapp/utilities/constants.dart';
import 'package:tasksapp/widgets/appbar.dart';
import 'package:tasksapp/widgets/drawer.dart';

import '../blocs/bloc_exports.dart';
import '../widgets/task_list.dart';

class TasksScreen extends StatefulWidget {
  static const id = '/';
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const AddTaskScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  color: kprimaryColor,
                  child: Text(
                    'Yes',
                    style: TextStyle(color: kwhiteColor),
                  ),
                ),
              ],
            ),
          ) ??
          false;
    }

    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return WillPopScope(
          onWillPop: showExitPopup,
          child: Scaffold(
            drawer: CustomDrawer(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: kprimaryColor,
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(
                Icons.add,
                color: kwhiteColor,
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  CustomAppBar(
                    title: appName,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TasksList(taskList: taskList),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
