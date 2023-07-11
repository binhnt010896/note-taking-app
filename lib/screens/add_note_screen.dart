import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/controllers/note_editing_controller.dart';
import 'package:note_taking_app/controllers/note_list_controller.dart';
import 'package:note_taking_app/routes.dart';
import 'package:note_taking_app/widgets/title_editing_field.dart';

class CreateNoteScreen extends StatelessWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteListController noteListController = Get.put(NoteListController());
    return GetBuilder<NoteEditingController>(
      init: NoteEditingController(),
      builder: (controller) {
        return WillPopScope(
          onWillPop: () async {
            noteListController.getNotes();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              title: const TitleEditingField(),
              actions: [
                TextButton(
                    onPressed: () {
                      if (Get.arguments?[ArgumentNames.IS_EDIT] ?? false) {
                        controller.updateNote(context);
                      } else {
                        controller.addNote(context);
                      }
                    },
                    child: const Text('SAVE', style: TextStyle(color: Colors.white, fontSize: 16))
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
          ),
        );
      }
    );
  }
}
