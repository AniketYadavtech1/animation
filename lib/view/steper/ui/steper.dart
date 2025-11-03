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
              title: Text("Home"),
              content: HomeScreenView(),
              isActive: controller.currentStep.value >= 2,
            ),
          ],
          onStepContinue: controller.onNext, // ✅ only logic
          onStepCancel: controller.onBack, // ✅ only logic
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
