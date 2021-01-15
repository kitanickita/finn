import 'package:finn/models/word_models/word_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'word.freezed.dart';

@freezed
abstract class Word with _$Word {
  const factory Word({
    int id,
    String finnish,
    String translation,
    String english,
    String russian,
    int chapter,
  }) = _Word;

  factory Word.fromEntity(WordEntity entity) {
    return Word(
      id: entity.id,
      finnish: entity.finnish,
      translation: entity.translation,
      english: entity.english,
      russian: entity.russian,
      chapter: entity.chapter,
    );
  }
}
