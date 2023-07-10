import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/services/supabase_service.dart';

class NoteRepository {
  var supabaseService = SupabaseService();

  Future<List<Note>> fetchNoteList() async {
    var response = await supabaseService.fetchNoteList();
    return response.map((item) {
      return Note.fromJson(item);
    }).toList();
  }

  Future<bool> addNoteToList(Note newNote) async {
    try {
      await supabaseService.addNewNote(newNote);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateNote(Note note) async {
    try {
      await supabaseService.updateNote(note);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}