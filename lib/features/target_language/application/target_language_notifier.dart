import 'package:finn/domain/models/languages.dart';
import 'package:finn/features/target_language/infrastructure/target_language_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TargetLanguageNotifier extends StateNotifier<LanguageType> {
  final TargetLanguageRepository _repository;
  TargetLanguageNotifier(this._repository) : super(LanguageType.english);

  Future<void> getTargetLanguage() async {
    final language = _repository.getTargetLanguage();
    state = language;
  }

  Future<void> setTargetLanguage(LanguageType languageType) async {
    await _repository.setTargetLaguage(languageType);
  }
}
