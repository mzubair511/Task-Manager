import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/task/data/datasources/task_local_datasource.dart';
import 'features/task/data/repositories/task_repository_impl.dart';
import 'features/task/domain/usecases/add_task.dart';
import 'features/task/domain/usecases/delete_task.dart';
import 'features/task/domain/usecases/get_tasks.dart';
import 'features/task/domain/usecases/update_task.dart';
import 'features/task/presentations/bloc/task_bloc.dart';
import 'features/task/presentations/bloc/task_event.dart';
import 'features/task/presentations/pages/task_list_page.dart';
import 'package:task_management_app/features/task/presentations/pages/add_task_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  final repository = TaskRepositoryImpl();

  runApp(
    BlocProvider(
      create: (context) => TaskBloc(
        getTasks: GetTasksUseCase(repository),
        addTask: AddTaskUseCase(repository),
        updateTask: UpdateTaskUseCase(repository),
        deleteTask: DeleteTaskUseCase(repository),
      )..add(LoadTasksEvent()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TaskListPage(),
      routes: {
         '/add_task': (context)=> const AddTaskPage(),
      },
    );
  }
}