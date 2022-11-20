import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:tasksapp/blocs/notes_bloc/notes_data_bloc.dart';
import 'package:tasksapp/screens/main_screen/main_screen.dart';
import 'package:tasksapp/services/guid_gen.dart';
import 'package:tasksapp/utilities/colors.dart';
import 'package:tasksapp/widgets/backbutton_appbar.dart';

import '../../../blocs/dark_mode_bloc/dark_mode_bloc.dart';
import '../../../models/tasks.dart';

class DetailScreen extends StatelessWidget {
  final Task oldtask;
  static const id = 'createnotes';
  const DetailScreen({
    Key? key,
    required this.oldtask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController(text: oldtask.title);
    TextEditingController desc = TextEditingController(text: oldtask.desc);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kprimaryColor,
        onPressed: () {
          if (title.text.isNotEmpty) {
            var task = Task(
              title: title.text,
              desc: desc.text,
              id: oldtask.id,
              date: DateTime.now().toString(),
            );

            context
                .read<NotesDataBloc>()
                .add(EditTask(task: task, oldtask: oldtask));

            Navigator.pushReplacementNamed(context, MainScreen.id);
          } else {
            EasyLoading.showToast("Please Enter Title");
          }
        },
        tooltip: 'Add Task',
        child: const Icon(
          Icons.add,
          color: kwhiteColor,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BackButtonAppBar(
              title: 'Create Note',
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    controller: title,
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: desc,
                    maxLines: 20,
                    minLines: 1,
                    decoration: const InputDecoration(
                        labelText: 'Description', border: InputBorder.none),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
