import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasksapp/blocs/bloc_exports.dart';
import 'package:tasksapp/models/tasks.dart';

part 'notes_data_event.dart';
part 'notes_data_state.dart';

class NotesDataBloc extends HydratedBloc<NotesDataEvent, NotesDataState> {
  NotesDataBloc() : super(const NotesDataState()) {
    on<AddTask>(_onaddTask);
    on<EditTask>(_oneditTask);
    on<UpdateTask>(_onupdateTask);
    on<DeleteTask>(_ondeleteTask);
    on<RemovedTask>(_onRemovedTask);
    on<RestoreTask>(_onRestoreTask);
  }
  void _onaddTask(AddTask event, Emitter<NotesDataState> emit) {
    final state = this.state;
    emit(NotesDataState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      completedTasks: state.completedTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _oneditTask(EditTask event, Emitter<NotesDataState> emit) {
    final state = this.state;
    emit(NotesDataState(
      pendingTasks: List.from(state.pendingTasks)
        ..remove(event.oldtask)
        ..insert(0, event.task),
      completedTasks: state.completedTasks,
      removedTasks: state.removedTasks,
    ));
  }

  void _onupdateTask(UpdateTask event, Emitter<NotesDataState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTask = state.pendingTasks;
    List<Task> completedTask = state.completedTasks;
    task.isDone == false
        ? {
            pendingTask = List.from(pendingTask)..remove(task),
            completedTask = List.from(completedTask)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completedTask = List.from(completedTask)..remove(task),
            pendingTask = List.from(pendingTask)
              ..insert(0, task.copyWith(isDone: false))
          };

    emit(NotesDataState(
      pendingTasks: pendingTask,
      completedTasks: completedTask,
      removedTasks: state.removedTasks,
    ));
  }

  void _ondeleteTask(DeleteTask event, Emitter<NotesDataState> emit) {
    final state = this.state;
    emit(NotesDataState(
      pendingTasks: state.pendingTasks,
      completedTasks: state.completedTasks,
      removedTasks: List.from(state.removedTasks)..remove(event.task),
    ));
  }

  void _onRemovedTask(RemovedTask event, Emitter<NotesDataState> emit) {
    final state = this.state;
    emit(NotesDataState(
      pendingTasks: List.from(state.pendingTasks)..remove(event.task),
      completedTasks: List.from(state.completedTasks)..remove(event.task),
      removedTasks: List.from(state.removedTasks)
        ..add(event.task.copyWith(isDeleted: true)),
    ));
  }

  void _onRestoreTask(RestoreTask event, Emitter<NotesDataState> emit) {
    final state = this.state;
    emit(NotesDataState(
      pendingTasks: List.from(state.pendingTasks)
        ..insert(0, event.task.copyWith(isDeleted: false, isDone: false)),
      completedTasks: state.completedTasks,
      removedTasks: List.from(state.removedTasks)..remove(event.task),
    ));
  }

  @override
  NotesDataState? fromJson(Map<String, dynamic> json) {
    return NotesDataState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(NotesDataState state) {
    return state.toMap();
  }
}
