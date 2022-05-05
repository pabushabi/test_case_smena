import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:test_case_smena/config/injection.dart';

@LazySingleton()
class SharedStorage {
  final _prefs = getIt<SharedPreferences>();

  Future<bool> contains(String key) async {
    return _prefs.containsKey(key);
  }

  Future<void> clear(String key) async {
    _prefs.remove(key);
  }

  Future<void> clearAll() async {
    _prefs.clear();
  }

  Future get(String key) async {
    return _prefs.get(key);
  }

  Future<void> set(String key, value) async {
    switch (value.runtimeType) {
      case String:
        _prefs.setString(key, value as String);
        break;
      case int:
        _prefs.setInt(key, value as int);
        break;
      case bool:
        _prefs.setBool(key, value as bool);
        break;
      case double:
        _prefs.setDouble(key, value as double);
        break;
      case List:
        _prefs.setStringList(key, value as List<String>);
        break;
      case Null:
        _prefs.remove(key);
        break;
      default:
        _prefs.setString(key, value.toString());
    }
  }
}
