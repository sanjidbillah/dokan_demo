import 'package:shared_preferences/shared_preferences.dart';

// Service class for managing SharedPreferences
class SharedPreferencesService {
  // Singleton instance
  static SharedPreferencesService? _instance;

  // Private constructor for singleton pattern
  SharedPreferencesService._internal();

  // Getter to access the singleton instance
  static SharedPreferencesService get instance {
    _instance ??= SharedPreferencesService._internal();
    return _instance!;
  }

  // Future instance of SharedPreferences
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Method to set an integer value
  Future<void> setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setInt(key, value);
  }

  // Method to get an integer value
  Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  // Method to set a boolean value
  Future<void> setBool(String key, bool value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setBool(key, value);
  }

  // Method to get a boolean value
  Future<bool> getBool(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key) ?? false;
  }

  // Method to set a string value
  Future<void> setString(String key, String? value) async {
    final SharedPreferences prefs = await _prefs;
    if (value == null) {
      throw Exception("Value is null");
    }
    await prefs.setString(key, value);
  }

  // Method to get a string value
  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  // Method to check if a key exists
  Future<bool> contains(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.containsKey(key);
  }

  // Method to clear all key-value pairs
  Future<bool> clear() async {
    final SharedPreferences prefs = await _prefs;
    return prefs.clear();
  }

  // Method to remove a specific key-value pair
  Future<void> remove(String key) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.remove(key);
  }
}
