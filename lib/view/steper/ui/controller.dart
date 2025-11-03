import 'package:animation/view/steper/component/complete_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StepController extends GetxController {
  RxInt currentStep = 0.obs;
  RxBool loading = false.obs;
  final conEmail = TextEditingController();
  final conPass = TextEditingController();

  void onNext() {
    if (currentStep.value < 2) {
      currentStep.value++;
    }else{
      Get.to(() => CompleteView());
      // CompleteView();
    }
  }
  void onBack() {
    if (currentStep.value > 0) {
      currentStep.value--;
    }
  }
}
