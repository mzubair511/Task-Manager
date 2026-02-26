import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/delete_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/update_task.dart';
import 'task_event.dart';
import 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent,TaskState>{
  final GetTasksUseCase getTasks;
  final AddTaskUseCase addTask;
  final UpdateTaskUseCase updateTask;
  final DeleteTaskUseCase deleteTask;

  TaskBloc({
    required this.getTasks,
    required this.addTask,
    required this.updateTask,
    required this.deleteTask
}): super(TasksLoading()){

    on<LoadTasksEvent>((event, emit)async{
      emit(TasksLoading());
      try{
       final tasks = await getTasks();
       emit(TasksLoaded(tasks));
      }catch (e){
        emit(TasksError('Field to load tasks'));
      }
    });
    on<AddTaskEvent>((event ,emit)async{
      await addTask(event.task);
      add(LoadTasksEvent());
    });

    on<UpdateTaskEvent>((event ,emit)async{
      await updateTask(event.task);
      add(LoadTasksEvent());
    });
    on<DeleteTaskEvent>((event ,emit)async{
      await deleteTask(event.taskId);
      add(LoadTasksEvent());
    });
  }

}