import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/controllers/add_note_controller.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNoteController>(
      init: AddNoteController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Note Screen'),
            actions: [
              TextButton(
                  onPressed: () {
                    print(controller.quillController.document.toDelta().toJson());
                  },
                  child: Text('SAVE', style: TextStyle(color: Colors.white, fontSize: 16))
              )
            ],
          ),
          body: Column(
            children: [
              Quill.QuillToolbar.basic(
                controller: controller.quillController,
                embedButtons: FlutterQuillEmbeds.buttons(),
              ),
              Expanded(
                child: Quill.QuillEditor.basic(
                  controller: controller.quillController,
                  readOnly: false,
                ),
              )
            ],
          ),
        );
      }
    );
  }
}
