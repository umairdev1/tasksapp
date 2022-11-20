import 'package:flutter/material.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/blocs/navcount_bloc/navi_count_bloc.dart';
import 'package:tasksapp/screens/notes_screen/widgets/add_notes.dart';
import 'package:tasksapp/screens/todo_allscreens/widgets/add_tasks.dart';
import 'package:tasksapp/screens/notes_screen/notes_screen.dart';
import 'package:tasksapp/screens/recyclebin/recyle_bin.dart';
import 'package:tasksapp/screens/todo_allscreens/tasks_screen.dart';
import 'package:tasksapp/utilities/colors.dart';

class MainScreen extends StatelessWidget {
  static const id = 'mainscreen';
  const MainScreen({super.key});
  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => FractionallySizedBox(
            heightFactor: 0.7, child: const AddTaskScreen()));
  }

  void _addNotes(BuildContext context) {
    Navigator.pushNamed(context, CreateNoteScreen.id);
  }

  static const List<Widget> _widgetOptions = <Widget>[
    NotesScreen(),
    TasksScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('No'),
                ),
                MaterialButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  color: kprimaryColor,
                  child: Text(
                    'Yes',
                    style: TextStyle(color: kwhiteColor),
                  ),
                ),
              ],
            ),
          ) ??
          false;
    }

    return BlocBuilder<NaviCountBloc, NaviCountState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: showExitPopup,
          child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: kprimaryColor,
              onPressed: () =>
                  state.switchValue ? _addTask(context) : _addNotes(context),
              tooltip: 'Add Task',
              child: const Icon(
                Icons.add,
                color: kwhiteColor,
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 5,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    // alignment: AlignmentDirectional.centerStart,
                    children: [
                      state.switchValue
                          ? SizedBox.shrink()
                          : Positioned(
                              top: 10,
                              left: 5,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: kprimaryColor,
                              ),
                            ),
                      TextButton.icon(
                          onPressed: () {
                            context.read<NaviCountBloc>().add(TodoOffEvent());
                          },
                          icon: Icon(
                            Icons.note_alt_outlined,
                            color: state.switchValue ? Colors.grey : null,
                          ),
                          label: Text(
                            'Notes',
                            style: TextStyle(
                              color: state.switchValue ? Colors.grey : null,
                            ),
                          )),
                    ],
                  ),
                  Stack(
                    children: [
                      state.switchValue
                          ? Positioned(
                              top: 10,
                              left: 5,
                              child: CircleAvatar(
                                radius: 7,
                                backgroundColor: kprimaryColor,
                              ),
                            )
                          : SizedBox.shrink(),
                      TextButton.icon(
                          onPressed: () {
                            context.read<NaviCountBloc>().add(TodoOnEvent());
                          },
                          icon: Icon(
                            Icons.task_alt_rounded,
                            color: state.switchValue ? null : Colors.grey,
                          ),
                          label: Text(
                            'Todo',
                            style: TextStyle(
                              color: state.switchValue ? null : Colors.grey,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            body: Center(
              child: _widgetOptions.elementAt(state.switchValue ? 1 : 0),
            ),
          ),
        );
      },
    );
  }
}
