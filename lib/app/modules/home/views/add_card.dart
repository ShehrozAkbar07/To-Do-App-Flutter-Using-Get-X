import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:todo_app/app/core/utils/extension.dart';
import 'package:todo_app/app/modules/home/controllers/home_controller.dart';
import 'package:todo_app/app/widget/icons.dart';

import '../../../core/utils/values/colors.dart';
import '../../../data/models/task.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();

  AddCard({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var wp;
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
              radius: 5,
              title: 'Tasl Type',
              content: Form(
                key: homeCtrl.formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.0.wp),
                      child: TextFormField(
                        controller: homeCtrl.editController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Title',
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter your task title';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Wrap(
                        spacing: 2.0.wp,
                        children: icons
                            .map((e) => Obx(() {
                                  final index = icons.indexOf(e);
                                  return ChoiceChip(
                                    pressElevation: 0,
                                    label: e,
                                    selected: homeCtrl.chipIndex.value == index,
                                    onSelected: (bool selected) {
                                      homeCtrl.chipIndex.value =
                                          selected ? index : 0;
                                    },
                                  );
                                }))
                            .toList(),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: Size(150, 40)),
                        onPressed: () {
                          if (homeCtrl.formkey.currentState!.validate()) {
                            int icon =
                                icons[homeCtrl.chipIndex.value].icon!.codePoint;
                            String color =
                                icons[homeCtrl.chipIndex.value].color!.toHex();
                            var task = Task(
                              title: homeCtrl.editController.text,
                              icon: icon,
                              color: color,
                            );
                            Get.back();
                            homeCtrl.addTask(task)
                                ? EasyLoading.showSuccess('Create Sucess')
                                : EasyLoading.showError('Duplicated Task');
                          }
                        },
                        child: Text('Confirm'))
                  ],
                ),
              ));
          homeCtrl.editController.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
            color: Colors.grey,
            dashPattern: const [8, 4],
            child: Center(
                child: Icon(
              Icons.add,
              color: Colors.grey,
              size: 10.0.wp,
            ))),
      ),
    );
  }
}
