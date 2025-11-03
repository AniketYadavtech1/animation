import 'package:get/get.dart';

class StepController extends GetxController {
  RxInt currentStep = 0.obs;

  void onNext() {
    if (currentStep.value < 2) {
      currentStep.value++;
    }
  }

  void onBack() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }






}
