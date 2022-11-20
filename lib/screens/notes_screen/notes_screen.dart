import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/blocs/notes_bloc/notes_data_bloc.dart';

import 'package:tasksapp/models/tasks.dart';
import 'package:tasksapp/widgets/appbar.dart';
import 'package:tasksapp/widgets/drawer.dart';
import 'package:tasksapp/widgets/notes_list.dart';

class NotesScreen extends StatelessWidget {
  static const id = 'notes';
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: 'Notes',
            ),
            SizedBox(
              height: 10,
            ),
            BlocBuilder<NotesDataBloc, NotesDataState>(
              builder: (context, state) {
                List<Task> taskList = state.pendingTasks;
                return NotesList(taskList: taskList);
              },
            ),
          ],
        ),
      ),
    );
  }
}
