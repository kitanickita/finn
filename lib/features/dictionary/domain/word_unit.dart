import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_unit.freezed.dart';

@freezed
class WordUnit with _$WordUnit {
  const WordUnit._();
  const factory WordUnit({
    required int id,
    required String finnish,
    required String translation,
    required int chapter,
  }) = _WordUnit;

  factory WordUnit.empty() => const WordUnit(
        id: 0,
        chapter: 0,
        finnish: '',
        translation: '',
      );
}
