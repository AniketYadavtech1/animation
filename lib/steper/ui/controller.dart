import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StepController extends GetxController {
  RxInt currentStep = 0.obs;

  // TextField Controllers (Example: Login page)
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void nextStep() {
    if (currentStep.value < 2) {
      currentStep.value++;
    }
  }

  void previousStep() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
}
