import 'package:animation/view/steper/component/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';
import 'package:animation/view/steper/component/login.dart';
import 'package:animation/view/steper/component/details.dart';

class SteperWidget extends StatelessWidget {
  final StepController controller = Get.put(StepController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Horizontal Stepper")),
      body: Obx(
        () => Stepper(
          connectorColor: MaterialStateProperty.all(Colors.blue),

          type: StepperType.horizontal,
          currentStep: controller.currentStep.value,
          steps: [
            Step(
              title: Text("Login"),
              content: LoginPageWidget(),
              isActive: controller.currentStep.value >= 0,
              state: controller.currentStep.value > 0
                  ? StepState.complete
                  : controller.currentStep.value == 0
                  ? StepState.editing
                  : StepState.indexed,
            ),
            Step(
              title: Text("Details"),
              content: DetailsPageWidget(),
              isActive: controller.currentStep.value >= 1,
              state: controller.currentStep.value > 1
                  ? StepState.complete
                  : controller.currentStep.value == 1
                  ? StepState.editing
                  : StepState.indexed,
            ),
            Step(
              title: Text("Home"),
              content: HomeScreenView(),
              isActive: controller.currentStep.value >= 2,
              state: controller.currentStep.value > 2
                  ? StepState.complete
                  : controller.currentStep.value == 2
                  ? StepState.editing
                  : StepState.indexed,
            ),
          ],
          onStepContinue: controller.onNext,
          onStepCancel: controller.onBack,
          onStepTapped: null,

          controlsBuilder: (context, details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (controller.currentStep.value > 0)
                  ElevatedButton(
                    onPressed: controller.onBack,
                    child: Text("Back"),
                  ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: controller.onNext,
                  child: Text("Next"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
