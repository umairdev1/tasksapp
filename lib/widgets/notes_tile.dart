import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';
import 'package:tasksapp/blocs/notes_bloc/notes_data_bloc.dart';
import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/screens/notes_screen/widgets/detail_screen.dart';
import 'package:tasksapp/utilities/colors.dart';

class NotesTile extends StatelessWidget {
  const NotesTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  void _removeorDeleteTask(BuildContext ctx, Task task) {
    task.isDeleted!
        ? ctx.read<NotesDataBloc>().add(DeleteTask(task: task))
        : ctx.read<NotesDataBloc>().add(RemovedTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeBloc, DarkModeState>(
      builder: (context, darkstate) {
        return InkWell(
          onTap: () {
            if (task.isDeleted == false) {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: DetailScreen(
                        oldtask: task,
                      )));
            }
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: darkstate.switchValue
                            ? (kwhiteColor)
                            : (task.isDone! ? ksecondaryColor : Colors.black),
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null),
                  ),
                  Text(
                    task.desc!,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 14,
                        color: darkstate.switchValue
                            ? (kwhiteColor)
                            : (task.isDone!
                                ? ksecondaryColor
                                : Color.fromARGB(255, 89, 88, 88)),
                        decoration:
                            task.isDone! ? TextDecoration.lineThrough : null),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: task.isDeleted!
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.spaceBetween,
                    children: [
                      task.isDeleted!
                          ? InkWell(
                              onTap: () {
                                context
                                    .read<NotesDataBloc>()
                                    .add(RestoreTask(task: task));
                              },
                              child: Icon(
                                Icons.refresh,
                              ),
                            )
                          : SizedBox.shrink(),
                      InkWell(
                        onTap: () {
                          _removeorDeleteTask(context, task);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      )
                    ],
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
