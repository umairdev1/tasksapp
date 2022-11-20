import 'package:flutter/material.dart';
import 'package:tasksapp/services/guid_gen.dart';
import 'package:tasksapp/utilities/colors.dart';

import '../../../blocs/bloc_exports.dart';
import '../../../models/tasks.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Add Task",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            textCapitalization: TextCapitalization.words,
            controller: title,
            autofocus: true,
            onFieldSubmitted: (value) {
              var task = Task(
                title: title.text,
                id: GUIDGen.generate(),
                date: DateTime.now().toString(),
              );

              context.read<TasksBloc>().add(AddTask(task: task));
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                labelText: 'Title', border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              ElevatedButton(
                  onPressed: () {
                    var task = Task(
                      title: title.text,
                      id: GUIDGen.generate(),
                      date: DateTime.now().toString(),
                    );

                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Add",
                    style: TextStyle(color: kwhiteColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
