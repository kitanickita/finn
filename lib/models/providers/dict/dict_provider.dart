import 'package:flutter_riverpod/all.dart';

import 'package:finn/models/dict_repository/dict_repository.dart';
import 'package:finn/models/language_models/language.dart';
import 'package:finn/models/language_models/languages.dart';
import 'package:finn/models/providers/dict/dict_state.dart';
import 'package:finn/models/word_models/word_model.dart';

//  Create repository provider
final dictRepository = Provider.autoDispose<DictRepository>((ref) {
  return DictRepository();
});
// Dictionary provider
final dictProvider = StateNotifierProvider.autoDispose<DictNotifier>((ref) {
  return DictNotifier(ref);
});

class DictNotifier extends StateNotifier<DictState> {
  final DictRepository _repository;

  DictNotifier(ProviderReference ref)
      : _repository = ref.read(dictRepository),
        super(DictState());

  void resetSearchField() {
    final newState = state.copyWith(search: '');
    state = newState;
  }

  Future<void> searchDictForWords(String search) async {
    final newState = state.copyWith(search: search);

    state = newState;
    try {
      // this if operator disides whethere button chosen finnish or other language
      if (state.language == Languages.finnish) {
        final List<Word> wordList = await _repository.findInlanguage(
            search: search,
            language: languages[state.language].language,
            translation: languages[state.translation].language);
        state = state.copyWith(words: wordList);
      } else {
        final List<Word> wordList = await _repository.findInlanguage(
            search: search,
            language: languages[state.translation].language,
            translation: languages[state.translation].language);
        state = state.copyWith(words: wordList);
      }
    } catch (e) {
      // print('something went completle south');
    }
  }

  Future<void> languageSearchUpdate(Languages language) async {
    state = state.copyWith(language: language);
  }

  Future<void> translationSearchUpdate(Languages language) async {
    state = state.copyWith(translation: language, search: state.search ?? '');
    searchDictForWords(state.search);
  }
}
