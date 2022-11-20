import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/widgets/notes_tile.dart';

import 'task_tile.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    Key? key,
    required this.taskList,
  }) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AlignedGridView.count(
        crossAxisCount: 2,
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: NotesTile(task: task),
          );
        },
      ),

      // ListView.builder(
      //   itemCount: taskList.length,
      //   itemBuilder: (context, index) {
      // var task = taskList[index];
      // return Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: TaskTile(task: task),
      // );
      //   },
      // ),
    );
  }
}
