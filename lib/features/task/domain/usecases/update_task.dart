
import '../../data/repositories/task_repository_impl.dart';
import '../entities/task.dart';
import '../repositories/task_repository.dart';

class UpdateTaskUseCase {
  final TaskRepositoryImpl repository;

  UpdateTaskUseCase(this.repository);

  Future<void> call(Task task) async {
    await repository.updateTask(task);
  }
}