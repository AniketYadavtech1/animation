import 'package:animation/steper/ui/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DetailsPageWidget extends StatelessWidget {
  final StepController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("You Entered:"),
        Text("Name: ${controller.nameController.text}"),
        Text("Email: ${controller.emailController.text}"),
      ],
    );
  }
}
