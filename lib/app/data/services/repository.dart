import 'package:todo_app/app/data/provider/task/provider.dart';

import '../models/task.dart';

class TaskRepository{
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});
  List<Task> readTask()=> taskProvider.readTask();
  void writeTasks(List<Task> tasks)=> taskProvider.writeTasks(tasks);
}