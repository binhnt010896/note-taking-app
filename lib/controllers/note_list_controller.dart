import 'package:get/get.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/repositories/note_repository.dart';

class NoteListController extends GetxController with StateMixin<List<Note>> {
  Rx<Note?> currentlyEditingNote = null.obs;
  NoteRepository noteRepo = NoteRepository();

  @override
  onInit() {
    super.onInit();
    change(null, status: RxStatus.empty());
    getNotes();
  }

  /// Methods
  setCurrentNote(Note newNote) => currentlyEditingNote(newNote);
  getNotes() {
    change(null, status: RxStatus.loading());
    noteRepo.fetchNoteList().then((notes) {
      if (notes.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(notes, status: RxStatus.success());
      }
    });
  }
}