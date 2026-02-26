import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:task_management_app/features/task/data/models/task_model.dart';

class TaskLocalDatasource{
   Database? _database;
  Future<Database> get database async{
    if(_database != null){
      return _database!;
    }
    _database =await _initDB();
    return _database!;
  }
  Future<Database> _initDB() async{
    final dbPath = await getDatabasesPath();
    final path = join (dbPath, 'task.db');
    return  await openDatabase(
        path,
        version: 1,
      onCreate: (db, version)async{
          await db.execute('''
            CREATE TABLE tasks(
              id TEXT PRIMARY KEY,
            title TEXR,
            description TEXT,
            dueDate TEXT,
             isCompleted INTEGER,

          )
          ''');
      },
    );
  }
  Future<void> insertTesk(TaskModel tesk)async{
    final db = await database;
    await db.insert(
      'task',
      tesk.toMap(),
     conflictAlgorithm : ConflictAlgorithm.replace
    );
  }
  Future<List<TaskModel>> getTasks() async {
    final db = await database;
    final maps = await db.query('tasks');

    return maps.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<void> updateTask(TaskModel task) async {
    final db = await database;
    await db.update(
      'tasks',
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  Future<void> deleteTask(String id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

