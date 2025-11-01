import 'package:animation/steper/component/details.dart';
import 'package:animation/steper/component/finalpage.dart';
import 'package:animation/steper/component/login.dart';
import 'package:animation/steper/ui/editor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class SteperWidget extends StatelessWidget {
  final StepController controller = Get.put(StepController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Horizontal Stepper"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuillEditorPage()),
              );
            },
            child: Text("fontChange"),
          ),
        ],
      ),
      body: Obx(
        () => Stepper(
          type: StepperType.horizontal,
          currentStep: controller.currentStep.value,
          steps: [
            Step(
              title: Text("Login"),
              content: LoginPageWidget(),
              isActive: controller.currentStep.value >= 0,
            ),
            Step(
              title: Text("Details"),
              content: DetailsPageWidget(),
              isActive: controller.currentStep.value >= 1,
            ),
            Step(
              title: Text("Finish"),
              content: FinishPageWidget(),
              isActive: controller.currentStep.value >= 2,
            ),
          ],
          onStepContinue: controller.nextStep,
          onStepCancel: controller.previousStep,
          onStepTapped: (index) => controller.currentStep.value = index,
        ),
      ),
    );
  }
}
