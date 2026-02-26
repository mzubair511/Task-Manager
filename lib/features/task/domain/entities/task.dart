import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final DateTime? dueDate;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    required this.description,
    this.dueDate,
    this.isCompleted = false,
  });


  Task copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isCompleted,

  }) {
    return Task(id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, dueDate, isCompleted];
}
class TaskEntity {
  final String id;
  final String title;
  final String description;
  final bool isDone;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}