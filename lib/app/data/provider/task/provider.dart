import 'dart:convert';

import 'package:get/get.dart';
import 'package:todo_app/app/core/utils/keys.dart';

import '../../models/task.dart';
import '../../services/service.dart';


class TaskProvider {
  final _storage = Get.find<StorageService>();

  List<Task> readTask(){
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString()).forEach((e)=> tasks.add(Task.fromJson(e)));
    return tasks;
  }
   void writeTasks(List<Task> tasks){
    _storage.write(taskKey, jsonEncode(tasks));
   }
}
