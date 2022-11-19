import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/utilities/colors.dart';
import 'package:tasksapp/widgets/appbar.dart';
import 'package:tasksapp/widgets/drawer.dart';
import 'package:tasksapp/widgets/task_list.dart';

import '../models/tasks.dart';
import '../utilities/constants.dart';

class RecycleBin extends StatelessWidget {
  static const id = 'recyclebin';
  const RecycleBin({super.key});

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
        List<Task> taskList = state.removedTasks;
        return WillPopScope(
          onWillPop: showExitPopup,
          child: Scaffold(
            drawer: CustomDrawer(),
            body: SafeArea(
              child: Column(
                children: [
                  CustomAppBar(
                    title: 'Recycle Bin',
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
