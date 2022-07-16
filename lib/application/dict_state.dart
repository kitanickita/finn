import 'package:finn/domain/models/word_unit.dart';
import 'package:finn/domain/models/languages.dart';
import 'package:flutter/foundation.dart';

class DictState {
  final List<WordUnit> words;
  final Languages language;
  final Languages translation;
  final String search;
  DictState({
    this.words = const [],
    this.language = Languages.finnish,
    this.translation = Languages.english,
    this.search = '',
  });

  DictState copyWith({
    List<WordUnit>? words,
    Languages? language,
    Languages? translation,
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
