import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'controller.dart';


class QuillEditorPage extends StatelessWidget {
  const QuillEditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<StepController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quill Rich Text Editor"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              String jsonData = controller.saveDocument();
              print("✅ Saved JSON : $jsonData");
            },
          ),
        ],
      ),

      body: Column(
        children: [
          /// ✅ NEW TOOLBAR (flutter_quill v11+)
          // quill.QuillToolbar(
          //   configurations: quill.QuillToolbarConfigurations(
          //     controller: controller.quillController,
          //     showFontFamily: true,
          //     showFontSize: true,
          //     showBoldButton: true,
          //     showItalicButton: true,
          //     showUnderLineButton: true,
          //     showStrikeThrough: true,
          //     showColorButton: true,
          //     showBackgroundColorButton: true,
          //     showListBullets: true,
          //     showListNumbers: true,
          //     showAlignmentButtons: true,
          //   ),
          // ),

          const SizedBox(height: 8),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: quill.QuillEditor(
                controller: controller.quillController,
                focusNode: FocusNode(),
                scrollController: ScrollController(),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
