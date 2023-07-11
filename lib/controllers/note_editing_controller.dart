import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:note_taking_app/controllers/note_list_controller.dart';
import 'package:note_taking_app/helpers/popups.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/repositories/note_repository.dart';

class NoteEditingController extends GetxController with StateMixin {
  QuillController quillController = QuillController.basic();
  Rx<Note> currentlyEditingNote = Note(
    title: 'Untitled',
    content: Note.emptyContent,
    createdAt: DateTime.now()
  ).obs;
  var isDirty = false.obs;
  RxStatus addEditStatus = RxStatus.empty();
  NoteRepository noteRepo = NoteRepository();
  NoteListController noteListController = Get.put(NoteListController());

  @override
  onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    addDocumentListener();
  }

  addDocumentListener() => quillController.document.changes.listen((event) {
    editBrief(quillController.document.getPlainText(0, 25));
    editContent(quillController.document.toDelta().toJson());
  });

  /// Editing
  editTitle(String title) => currentlyEditingNote(currentlyEditingNote.value.copyWith(
    title: title
  ));
  editBrief(String brief) => currentlyEditingNote(currentlyEditingNote.value.copyWith(
    brief: brief
  ));
  editContent(List content) => currentlyEditingNote(currentlyEditingNote.value.copyWith(
    content: content
  ));

  /// CRUD
  Future<void> addNote(context) async {
    change(null, status: RxStatus.loading());
    bool isSuccess = await noteRepo.addNoteToList([currentlyEditingNote.value]);
    if (isSuccess) {
      change(null, status: RxStatus.success());
      showSnackBar(context, text: 'Note added successfully!');
      Get.back();
      noteListController.getNotes();
    } else {
      change(null, status: RxStatus.error());
      showSnackBar(context, text: 'Fail to add your note!', snackBarType: SnackBarType.error);
    }
  }

  updateNote(context) async {
    change(null, status: RxStatus.loading());
    bool isSuccess = await noteRepo.updateNote(currentlyEditingNote.value);
    if (isSuccess) {
      change(null, status: RxStatus.success());
      showSnackBar(context, text: 'Note updated successfully!');
      Get.back();
      noteListController.getNotes();
    } else {
      change(null, status: RxStatus.error());
      showSnackBar(context, text: 'Fail to update your note!', snackBarType: SnackBarType.error);
    }
  }
}