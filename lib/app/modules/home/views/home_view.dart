import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/app/core/utils/extension.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(4.0.wp),
          child: Text(
            'My List',
            style: TextStyle(fontSize: 24.0.sp, fontWeight: FontWeight.bold),
          ),
        )
      ],
    )));
  }
}
