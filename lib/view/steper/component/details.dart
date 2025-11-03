import 'package:animation/view/steper/ui/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class DetailsPageWidget extends StatefulWidget {
  @override
  State<DetailsPageWidget> createState() => _DetailsPageWidgetState();
}

class _DetailsPageWidgetState extends State<DetailsPageWidget> {
  final con = Get.put<StepController>(StepController());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFormField(controller: con.conEmail),
          TextFormField(controller: con.conPass),
          Text("Details"),
        ],
      ),
    );
  }
}
