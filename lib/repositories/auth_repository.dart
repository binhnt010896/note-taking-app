import 'package:note_taking_app/services/localstorage.dart';
import 'package:note_taking_app/services/supabase_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  var supabaseService = SupabaseService();

  Future signUp(String email, String password) async {
    try {
      AuthResponse response = await supabaseService.signUp(email, password);
      User? user = response.user;
      Session? session = response.session;
      if (user != null) {
        storage.saveString(LS.USER, user.toJson().toString());
      }
      if (session != null) {
        storage.saveString(LS.SESSION, session.toJson().toString());
      }
    } catch (e) {
      rethrow;
    }
  }

  login(String email, String password) async {
    try {
      await supabaseService.login(email, password);
    } catch (e) {
      rethrow;
    }
  }
}