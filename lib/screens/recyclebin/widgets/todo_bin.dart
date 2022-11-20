import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';

import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/widgets/notes_list.dart';
import 'package:tasksapp/widgets/task_list.dart';

class TodoBin extends StatelessWidget {
  const TodoBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.removedTasks;
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TasksList(taskList: taskList),
            ],
          ),
        );
      },
    );
  }
}
