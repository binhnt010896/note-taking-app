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
}