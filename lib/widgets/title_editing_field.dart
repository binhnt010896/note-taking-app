import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:note_taking_app/controllers/note_editing_controller.dart';

class TitleEditingField extends StatelessWidget {
  const TitleEditingField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const InputBorder defaultBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white)
    );
    return GetBuilder<NoteEditingController>(
      init: NoteEditingController(),
      builder: (controller) {
        return TextFormField(
          initialValue: controller.currentlyEditingNote.value.title,
          style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          decoration: const InputDecoration(
            border: defaultBorder,
            focusedBorder: defaultBorder,
            enabledBorder: defaultBorder,
          ),
          onChanged: (title) => controller.editTitle(title),
        );
      },
    );
  }
}
