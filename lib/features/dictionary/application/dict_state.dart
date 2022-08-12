import 'package:finn/features/dictionary/domain/languages.dart';
import 'package:finn/features/dictionary/domain/word_unit.dart';
import 'package:flutter/foundation.dart';

class DictState {
  final List<WordUnit> words;
  final LanguageType language;
  final LanguageType translation;
  final String search;
  DictState({
    this.words = const [],
    this.language = LanguageType.finnish,
    this.translation = LanguageType.english,
    this.search = '',
  });

  DictState copyWith({
    List<WordUnit>? words,
    LanguageType? language,
    LanguageType? translation,
    String? search,
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
