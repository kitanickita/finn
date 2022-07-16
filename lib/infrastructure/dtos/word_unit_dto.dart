import 'package:finn/domain/models/word_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_unit_dto.freezed.dart';

part 'word_unit_dto.g.dart';

@freezed
class WordUnitDTO with _$WordUnitDTO {
  const WordUnitDTO._();
  const factory WordUnitDTO({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "finnish") required String finnish,
    @JsonKey(name: "translation") required String translation,
    @JsonKey(name: "english") required String english,
    @JsonKey(name: "russian") required String russian,
    @JsonKey(name: 'chapter') required int chapter,
  }) = _WordUnitDTO;

  factory WordUnitDTO.fromJson(Map<String, dynamic> json) =>
      _$WordUnitDTOFromJson(json);
  factory WordUnitDTO.toJson() => WordUnitDTO.toJson();
  WordUnit toDomain() => WordUnit(
        id: id,
        finnish: finnish,
        translation: translation,
        english: english,
        russian: russian,
        chapter: chapter,
      );

  factory WordUnitDTO.fromDb(Map<String, dynamic> data, String translation) {
    return WordUnitDTO(
      id: data['id'] ?? '',
      finnish: data['finnish'] ?? '',
      translation: data[translation] ?? '',
      english: data['english'] ?? '',
      russian: data['russian'] ?? '',
      chapter: data['chapter'] ?? '',
    );
  }
}
