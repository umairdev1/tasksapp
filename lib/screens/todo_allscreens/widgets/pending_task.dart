import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/widgets/task_list.dart';

import '../../../models/tasks.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.pendingTasks;
        return TasksList(taskList: taskList);
      },
    );
  }
}
