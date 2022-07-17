import 'dart:ffi';

import 'package:finn/features/target_language/infrastructure/abstract_target_language_storage.dart';
import 'package:finn/domain/models/language.dart';
import 'package:finn/domain/models/languages.dart';

class TargetLanguageRepository {
  final AbstractTargetLanguageStorage _storage;

  TargetLanguageRepository(this._storage);

  LanguageType getTargetLanguage() {
    final language = _storage.read();
    return LanguageType.parseFromString(language);
  }

  Future<void> setTargetLaguage(LanguageType languageType) async {
    await _storage.save(languageType.toString());
  }
}
