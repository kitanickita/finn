import 'package:finn/features/target_language/infrastructure/abstract_target_language_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TargetLanguageStorage implements AbstractTargetLanguageStorage {
  final SharedPreferences _storage;
  static const _key = 'language';
  TargetLanguageStorage(this._storage);

  @override
  String read() {
    return _storage.getString(_key) ?? 'english';
  }

  @override
  Future<void> save(String language) async {
    await _storage.setString(_key, language);
  }
}
