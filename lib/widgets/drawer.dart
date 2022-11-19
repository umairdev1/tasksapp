import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/dark_mode_bloc/dark_mode_bloc.dart';
import 'package:tasksapp/screens/recyle_bin.dart';
import 'package:tasksapp/screens/tasks_screen.dart';
import 'package:tasksapp/utilities/colors.dart';
import 'package:tasksapp/utilities/constants.dart';

import '../blocs/bloc_exports.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
              decoration: BoxDecoration(color: kprimaryColor),
              child: Center(
                  child: Text(
                appName,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: kwhiteColor,
                ),
              ))),
          Expanded(
              child: ListView(
            children: [
              BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, TasksScreen.id);
                    },
                    horizontalTitleGap: 0.0,
                    leading: const Icon(Icons.note_add_rounded),
                    title: const Text(
                      "All Notes",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Text(state.allTasks.length.toString()),
                  );
                },
              ),
              BlocBuilder<TasksBloc, TasksState>(
                builder: (context, state) {
                  return ListTile(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RecycleBin.id);
                    },
                    horizontalTitleGap: 0.0,
                    leading: const Icon(Icons.recycling),
                    title: const Text(
                      "Recycle Bin",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Text(state.removedTasks.length.toString()),
                  );
                },
              ),
              BlocBuilder<DarkModeBloc, DarkModeState>(
                builder: (context, state) {
                  return ListTile(
                    horizontalTitleGap: 0.0,
                    leading: Icon(state.switchValue
                        ? Icons.dark_mode_rounded
                        : Icons.light_mode_rounded),
                    title: Text(
                      state.switchValue ? "Dark Mode" : "Light Mode",
                      style: TextStyle(fontSize: 16),
                    ),
                    trailing: Switch(
                        value: state.switchValue,
                        onChanged: (val) {
                          val
                              ? context
                                  .read<DarkModeBloc>()
                                  .add(DarkModeOnEvent())
                              : context
                                  .read<DarkModeBloc>()
                                  .add(DarkModeOffEvent());
                        }),
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
