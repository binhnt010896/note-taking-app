import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Storage _singleton = Storage._internal();
  late SharedPreferences _prefs;

  factory Storage() {
    return _singleton;
  }

  Storage._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveBoolean(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  Future<bool> getBoolean(String key) async {
    return _prefs.getBool(key) ?? false;
  }

  Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  Future<void> saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? -1;
  }

  Future<void> saveDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  Future<double> getDouble(String key) async {
    return _prefs.getDouble(key) ?? 0;
  }
}

class LS {
  static const String USER = 'user';
  static const String SESSION = 'session';
  static const String NOTES = 'notes';
}

final storage = Storage();