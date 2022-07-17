import 'package:freezed_annotation/freezed_annotation.dart';
part 'word.freezed.dart';

@freezed
class Word with _$Word {
  const Word._();
  const factory Word({
    required int id,
    required String finnish,
    required String translation,
    required int chapter,
  }) = _Word;
}
