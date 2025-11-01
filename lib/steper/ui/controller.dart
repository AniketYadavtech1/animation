import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';

class StepController extends GetxController {
  RxInt currentStep = 0.obs;
  late quill.QuillController quillController;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    /// ✅ Default empty document
    quillController = quill.QuillController(
      document: quill.Document(),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

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

  /// ✅ Save rich-text to JSON
  String saveDocument() {
    return jsonEncode(quillController.document.toDelta().toJson());
  }

  /// ✅ Load JSON document into editor
  void loadDocument(String jsonString) {
    try {
      final decodedJson = jsonDecode(jsonString);

      final doc = quill.Document.fromJson(decodedJson);

      quillController = quill.QuillController(
        document: doc,
        selection: const TextSelection.collapsed(offset: 0),
      );

      update(); // ✅ Updates UI when using GetBuilder()/Obx()

    } catch (e) {
      debugPrint("❌ Error loading document: $e");
    }
  }
}
