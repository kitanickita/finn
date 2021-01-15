import 'package:equatable/equatable.dart';

class WordEntity extends Equatable {
  final int id;
  final String finnish;
  final String translation;
  final String english;
  final String russian;
  final int chapter;
  const WordEntity({
    this.id,
    this.finnish,
    this.translation,
    this.english,
    this.russian,
    this.chapter,
  });

  @override
  List<Object> get props =>
      [id, chapter, finnish, translation, english, russian];

  @override
  String toString() => '''
  Note {
    id: $id,
    finnish: $finnish,
    translation: $translation,
    english: $english,
    russian: $russian,
    chapter: $chapter
  }''';

  Map<String, dynamic> toDb() {
    return {
      'id': id,
      'finnish': finnish,
      'english': english,
      'russian': russian,
      'chapter': chapter,
    };
  }

  factory WordEntity.fromDb(Map<String, dynamic> data, String translation) {
    return WordEntity(
      id: data['id'] ?? '',
      finnish: data['finnish'] ?? '',
      translation: data[translation] ?? '',
      english: data['english'] ?? '',
      russian: data['russian'] ?? '',
      chapter: data['chapter'] ?? '',
    );
  }
}
