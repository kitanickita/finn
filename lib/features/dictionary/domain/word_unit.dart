import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_unit.freezed.dart';

@freezed
class WordUnit with _$WordUnit {
  const WordUnit._();
  const factory WordUnit({
    required int id,
    required String finnish,
    required String translation,
    required String english,
    required String russian,
    required int chapter,
  }) = _WordUnit;

  factory WordUnit.empty() => const WordUnit(
        id: 0,
        chapter: 0,
        english: '',
        finnish: '',
        russian: '',
        translation: '',
      );
}
