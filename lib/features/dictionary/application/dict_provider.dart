import 'package:finn/features/dictionary/application/dict_state.dart';
import 'package:finn/features/dictionary/domain/i_word_repository.dart';
import 'package:finn/features/dictionary/domain/languages.dart';
import 'package:finn/features/dictionary/domain/word_unit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DictNotifier extends StateNotifier<DictState> {
  final IWordRepository _repository;

  DictNotifier(this._repository) : super(DictState());

  void resetSearchField() {
    final newState = state.copyWith(search: '');
    state = newState;
  }

  Future<void> searchDictForWords(String search) async {
    final newState = state.copyWith(search: search);

    state = newState;
    try {
      // this if operator disides whethere button chosen finnish or other language
      if (state.language == LanguageType.finnish) {
        final List<WordUnit> wordList = await _repository.find(
          search: search,
          language: state.language.name,
          translation: state.translation.name,
        );
        state = state.copyWith(words: wordList);
      } else {
        final List<WordUnit> wordList = await _repository.find(
          search: search,
          language: state.translation.name,
          translation: state.translation.name,
        );
        state = state.copyWith(words: wordList);
      }
    } catch (e) {
      // print('something went completle south');
    }
  }

  Future<void> languageSearchUpdate(LanguageType language) async {
    state = state.copyWith(language: language);
  }

  Future<void> translationSearchUpdate(LanguageType? language) async {
    state = state.copyWith(translation: language, search: state.search);
    searchDictForWords(state.search);
  }
}
