import 'dart:convert';

import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/services/localstorage.dart';
import 'package:note_taking_app/services/supabase_service.dart';
import 'package:uuid/uuid.dart';

class NoteRepository {
  var supabaseService = SupabaseService();

  bool _isAuth() => supabaseService.supabase.auth.currentUser != null;

  Future<List<Note>> fetchNoteList() async {
    var response = [];
    if (_isAuth()) {
      /// Fetch notes from cloud
      response = await supabaseService.fetchNoteList();
    } else {
      /// Fetch notes from localstorage
      String storageNotesString = storage.getString(LS.NOTES);
      if (storageNotesString.isEmpty) storageNotesString = '[]';
      response = json.decode(storageNotesString);
    }
    return response.map((item) {
      return Note.fromJson(item);
    }).toList();
  }

  Future<bool> addNoteToList(List<Note> newNotes) async {
    try {
      if (_isAuth()) {
        /// Add note to cloud
        await supabaseService.addNewNote(newNotes);
      } else {
        /// Add note to local storage
        String storageNotesString = storage.getString(LS.NOTES);
        if (storageNotesString.isEmpty) storageNotesString = '[]';
        List storageNoteJson = json.decode(storageNotesString);
        for (var note in newNotes) {
          storageNoteJson.add(note.copyWith(
            id: const Uuid().v1(),
            createdAt: DateTime.now()
          ).toJSON());
        }
        storage.saveString(LS.NOTES, json.encode(storageNoteJson));
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateNote(Note note) async {
    try {
      if (_isAuth()) {
        /// Add note to cloud
        await supabaseService.updateNote(note);
      } else {
        /// Add note to local storage
        String storageNotesString = storage.getString(LS.NOTES);
        if (storageNotesString.isEmpty) storageNotesString = '[]';
        List storageNoteJson = json.decode(storageNotesString);
        Map<String, dynamic>? editingNote = storageNoteJson.firstWhere((e) => e['id'] == note.id);
        if (editingNote != null) {
          editingNote.update('title', (value) => note.title);
          editingNote.update('brief', (value) => note.brief);
          editingNote.update('content', (value) => note.content);
        }
        storage.saveString(LS.NOTES, json.encode(storageNoteJson));
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}