part of 'notes_data_bloc.dart';

abstract class NotesDataEvent extends Equatable {
  const NotesDataEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends NotesDataEvent {
  final Task task;
  const AddTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class UpdateTask extends NotesDataEvent {
  final Task task;
  const UpdateTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class EditTask extends NotesDataEvent {
  final Task task;
  final Task oldtask;
  const EditTask({
    required this.task,
    required this.oldtask,
  });
  @override
  List<Object> get props => [task, oldtask];
}

class DeleteTask extends NotesDataEvent {
  final Task task;
  const DeleteTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class RemovedTask extends NotesDataEvent {
  final Task task;
  const RemovedTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}

class RestoreTask extends NotesDataEvent {
  final Task task;
  const RestoreTask({
    required this.task,
  });
  @override
  List<Object> get props => [task];
}
