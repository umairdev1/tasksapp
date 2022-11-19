import 'package:flutter/material.dart';

import 'package:tasksapp/models/tasks.dart';

import 'task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TaskTile(task: task),
          );
        },
      ),
    );
  }
}
