import 'package:equatable/equatable.dart';

import '../../domain/entities/task.dart';
abstract class TaskState extends Equatable{
  List<Object?> get props => [];
}
class TasksLoading extends TaskState{}

class TasksLoaded extends TaskState{
  final List<Task> tasks;
  TasksLoaded (this.tasks);
  List<Object?> get props=>[tasks];
}
class TasksError extends TaskState{
  final String massage;
   TasksError(this.massage);
    List<Object?> get props=>[massage];
}
