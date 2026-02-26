
import '../../data/repositories/task_repository_impl.dart';
import '../entities/task.dart';


class AddTaskUseCase {
  final TaskRepositoryImpl repository;

  AddTaskUseCase(this.repository);

  Future<void> call(Task task) async {
    await repository.addTask(task);
  }
}