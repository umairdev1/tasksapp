import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasksapp/blocs/notes_bloc/notes_data_bloc.dart';
import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/widgets/notes_list.dart';

class NotesBin extends StatelessWidget {
  const NotesBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesDataBloc, NotesDataState>(
      builder: (context, state) {
        List<Task> taskList = state.removedTasks;
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotesList(taskList: taskList),
            ],
          ),
        );
      },
    );
  }
}
