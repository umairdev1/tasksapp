import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  String? desc;
  final String date;
  final String id;
  bool? isDone;

  bool? isDeleted;

  Task({
    required this.title,
    required this.date,
    this.desc,
    required this.id,
    this.isDone,
    this.isDeleted,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
  }

  Task copyWith({
    String? title,
    String? desc,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      desc: desc ?? this.desc,
      date: date ?? this.date,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'desc': desc,
      'date': date,
      'id': id,
      'isDone': isDone,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      desc: map['desc'] != null ? map['desc'] as String : null,
      date: map['date'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }
  @override
  List<Object?> get props => [id, title, desc, date, isDone, isDeleted];
}
