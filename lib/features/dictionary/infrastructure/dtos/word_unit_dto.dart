import 'package:finn/features/dictionary/domain/word_unit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'word_unit_dto.freezed.dart';

@freezed
class WordUnitDTO with _$WordUnitDTO {
  const WordUnitDTO._();
  const factory WordUnitDTO({
    @JsonKey(name: "id") required int id,
    @JsonKey(name: "finnish") required String finnish,
    required String translation,
    @JsonKey(name: 'chapter') required int chapter,
  }) = _WordUnitDTO;

  // factory WordUnitDTO.fromJson(Map<String, dynamic> json) =>
  //     _$WordUnitDTOFromJson(json);
  // factory WordUnitDTO.toJson() => WordUnitDTO.toJson();
  WordUnit toDomain() => WordUnit(
        id: id,
        finnish: finnish,
        translation: translation,
        chapter: chapter,
      );

  factory WordUnitDTO.fromDb(Map<String, dynamic> data, String translation) {
    return WordUnitDTO(
      id: data['id'] ?? '',
      finnish: data['finnish'] ?? '',
      translation: data[translation] ?? '',
      chapter: data['chapter'] ?? '',
    );
  }
}
