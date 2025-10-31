import 'package:animation/steper/ui/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class LoginPageWidget extends StatelessWidget {
  final StepController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller.nameController,
          decoration: InputDecoration(labelText: "Enter Name"),
        ),
        SizedBox(height: 10),
        TextField(
          controller: controller.emailController,
          decoration: InputDecoration(labelText: "Enter Email"),
        ),
      ],
    );
  }
}
