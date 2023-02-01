import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/services/repository.dart';

import '../../../data/models/task.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});
  final formkey = GlobalKey<FormState>();
  final editController = TextEditingController();
  final chipIndex = 0.obs;

  final tasks = <Task>[].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTask());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void changeChipIndex(int value){
    chipIndex.value = value;
     
  }

  void increment() => count.value++;
}
