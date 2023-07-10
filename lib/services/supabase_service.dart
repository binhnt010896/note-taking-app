import 'package:note_taking_app/models/note.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class SupabaseService {
  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> fetchNoteList() {
    return supabase
        .from('notes')
        .select()
        .order('id', ascending: true)
        .select();
  }

  Future<List<Map<String, dynamic>>> addNewNote(Note note) {
    var uuid = const Uuid();
    return supabase
        .from('notes')
        .insert([note.copyWith(
          id: uuid.v1()
        ).toJSON()])
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