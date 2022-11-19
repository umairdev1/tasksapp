import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';
import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/utilities/colors.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
  void _removeorDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<TasksBloc>().add(DeleteTask(task: task))
        : ctx.read<TasksBloc>().add(RemovedTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, darkstate) {
        return Dismissible(
          background: Container(
            decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          key: ValueKey(task),
          onDismissed: (DismissDirection direction) {
            _removeorDeleteTask(context, task);
          },
          child: Container(
            decoration: BoxDecoration(
                color: darkstate.switchValue ? kprimaryColor : kwhiteColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(35),
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: darkstate.switchValue
                              ? (kwhiteColor)
                              : (task.isDone! ? ksecondaryColor : Colors.black),
                          decoration:
                              task.isDone! ? TextDecoration.lineThrough : null),
                    ),
                  ),
                  Checkbox(
                    value: task.isDone,
                    activeColor:
                        darkstate.switchValue ? kwhiteColor : kprimaryColor,
                    shape: CircleBorder(),
                    checkColor:
                        darkstate.switchValue ? kprimaryColor : kwhiteColor,
                    onChanged: task.isDeleted == false
                        ? (value) {
                            context
                                .read<TasksBloc>()
                                .add(UpdateTask(task: task));
                          }
                        : null,
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
