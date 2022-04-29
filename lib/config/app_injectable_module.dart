import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Main module for injection.
@module
abstract class AppInjectableModule {
  /// Initialized  [SharedPreferences].
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}