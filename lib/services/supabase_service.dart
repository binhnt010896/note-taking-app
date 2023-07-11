import 'package:note_taking_app/models/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;
  /// AUTH
  signUp(String email, String password) async {
    return await supabase.auth.signUp(
      email: email,
      password: password,
    ).onError((error, stackTrace) {
      throw (error as AuthException).message;
    });
  }

  login(String email, String password) async {
    return await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    ).onError((error, stackTrace) {
      throw (error as AuthException).message;
    });
  }

  /// NOTES
  Future<List<Map<String, dynamic>>> fetchNoteList() {
    return supabase
        .from('notes')
        .select()
        .eq('user_id', supabase.auth.currentUser?.id)
        .order('id', ascending: true)
        .select();
  }

  Future<List<Map<String, dynamic>>> addNewNote(List<Note> notes) {
    var uuid = const Uuid();
    print('ahoho ${notes.map((note) => note.copyWith(
        id: uuid.v1(),
        userId: supabase.auth.currentUser?.id
    ).toJSON()).toList()}');
    return supabase
        .from('notes')
        .insert(notes.map((note) => note.copyWith(
          id: uuid.v1(),
          userId: supabase.auth.currentUser?.id
        ).toJSON()).toList())
        .select();
  }

  Future<List<Map<String, dynamic>>> updateNote(Note note) {
    return supabase
        .from('notes')
        .update(note.toJSON())
        .eq('id', note.id)
        .select();
  }
}