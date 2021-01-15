import 'package:finn/models/language_models/languages.dart';
import 'package:finn/models/word_models/word_model.dart';
import 'package:flutter/foundation.dart';

class DictState {
  final List<Word> words;
  final Languages language;
  final Languages translation;
  final String search;
  DictState({
    this.words,
    this.language = Languages.finnish,
    this.translation = Languages.english,
    this.search,
  });

  DictState copyWith({
    List<Word> words,
    Languages language,
    Languages translation,
    String search,
  }) {
    return DictState(
      words: words ?? this.words,
      language: language ?? this.language,
      translation: translation ?? this.translation,
      search: search ?? this.search,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is DictState &&
        listEquals(o.words, words) &&
        o.language == language &&
        o.translation == translation &&
        o.search == search;
  }

  @override
  int get hashCode {
    return words.hashCode ^
        language.hashCode ^
        translation.hashCode ^
        search.hashCode;
  }
}
