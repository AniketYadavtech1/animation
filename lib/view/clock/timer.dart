import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt seconds = 0.obs;
  Timer? timer;
  RxBool isRunning = false.obs;

  void startTimer() {
    if (timer != null && timer!.isActive) return;
    isRunning.value = true;
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      seconds.value++;
    });
  }

  void stopTimer() {
    timer?.cancel();
    isRunning.value = false;
  }

  void resetTimer() {
    timer?.cancel();
    seconds.value = 0;
    isRunning.value = false;
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}

class TimerCountView extends StatelessWidget {
  final TimerController controller = Get.put(TimerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Smart Timer")),

      body: Center(
        child: Obx(() {
          int days = controller.seconds.value ~/ (24 * 3600);
          int hours = (controller.seconds.value % (24 * 3600)) ~/ 3600;
          int minutes = (controller.seconds.value % 3600) ~/ 60;
          int secs = controller.seconds.value % 60;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${_twoDigit(days)} : ${_twoDigit(hours)} : ${_twoDigit(minutes)} : ${_twoDigit(secs)}",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.isRunning.value
                        ? controller.stopTimer
                        : controller.startTimer,
                    child: Text(controller.isRunning.value ? "Stop" : "Start"),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: controller.resetTimer,
                    child: Text("Reset"),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  String _twoDigit(int n) => n.toString().padLeft(2, '0');
}
