import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as Quill;
import 'package:note_taking_app/controllers/note_editing_controller.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/routes.dart';

class NoteListItem extends StatelessWidget {
  final Note item;
  const NoteListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteEditingController noteEditingController = Get.put(NoteEditingController());
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.brief ?? '-', maxLines: 1, overflow: TextOverflow.ellipsis,),
      trailing: const Icon(Icons.chevron_right_rounded, size: 36),
      onTap: () {
        noteEditingController.currentlyEditingNote(item);
        noteEditingController.quillController.document = Quill.Document.fromJson(item.content ?? Note.emptyContent);
        noteEditingController.addDocumentListener();
        Get.toNamed(RouteNames.ADD_NEW_NOTE, arguments: {
          ArgumentNames.IS_EDIT: true
        });
      },
    );
  }
}
