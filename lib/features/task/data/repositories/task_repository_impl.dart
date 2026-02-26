import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {

  final List<Task> _tasks = [];

  Future<List<Task>> getAllTasks() async {
    return _tasks;
  }


  Future<void> addTask(Task task) async {
    _tasks.add(task);
  }


  Future<void> updateTask(Task task) async {
    final index = _tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _tasks[index] = task;
    }
  }


  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((task) => task.id == taskId);
  }
}