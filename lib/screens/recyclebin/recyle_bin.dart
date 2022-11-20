import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/blocs/navcount_bloc/navi_count_bloc.dart';
import 'package:tasksapp/screens/main_screen/main_screen.dart';
import 'package:tasksapp/screens/recyclebin/widgets/notes_bin.dart';
import 'package:tasksapp/screens/recyclebin/widgets/todo_bin.dart';
import 'package:tasksapp/screens/todo_allscreens/tasks_screen.dart';
import 'package:tasksapp/utilities/colors.dart';
import 'package:tasksapp/widgets/appbar.dart';
import 'package:tasksapp/widgets/drawer.dart';
import 'package:tasksapp/widgets/task_list.dart';

import '../../models/tasks.dart';
import '../../utilities/constants.dart';

class RecycleBin extends StatefulWidget {
  static const id = 'recyclebin';
  RecycleBin({super.key});

  @override
  State<RecycleBin> createState() => _RecycleBinState();
}

class _RecycleBinState extends State<RecycleBin> {
  String notetype = '';
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      Navigator.pushReplacementNamed(context, MainScreen.id);
      return false;
    }

    return BlocBuilder<NaviCountBloc, NaviCountState>(
      builder: (context, state) {
        // List<Task> taskList = state.removedTasks;
        return WillPopScope(
            onWillPop: showExitPopup,
            child: Scaffold(
              drawer: CustomDrawer(),
              body: SafeArea(
                child: Column(
                  children: [
                    CustomAppBar(
                      title: 'Recycle Bin',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    notetype == ''
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TodoChip(
                                  icon: Icons.note_alt_outlined,
                                  title: 'Notes Bin',
                                  active: state.switchValue ? false : true,
                                  press: () {
                                    setState(() {
                                      notetype = "Notes Bin";
                                    });
                                  }),
                              TodoChip(
                                  icon: Icons.task_alt_rounded,
                                  title: 'Todo Bin',
                                  active: state.switchValue ? true : false,
                                  press: () {
                                    setState(() {
                                      notetype = "Todo Bin";
                                    });
                                  })
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                                TodoChip(
                                    icon: Icons.note_alt_outlined,
                                    title: 'Notes Bin',
                                    active:
                                        notetype == "Notes Bin" ? true : false,
                                    press: () {
                                      setState(() {
                                        notetype = "Notes Bin";
                                      });
                                    }),
                                TodoChip(
                                    icon: Icons.task_alt_rounded,
                                    title: 'Todo Bin',
                                    active:
                                        notetype == "Todo Bin" ? true : false,
                                    press: () {
                                      setState(() {
                                        notetype = "Todo Bin";
                                      });
                                    }),
                              ]),
                    SizedBox(
                      height: 10,
                    ),
                    notetype == ''
                        ? (state.switchValue ? TodoBin() : NotesBin())
                        : (notetype == "Todo Bin" ? TodoBin() : NotesBin())
                  ],
                ),
              ),
            ));
      },
    );
  }
}
