import 'package:finn/domain/models/word_unit.dart';

abstract class IWordRepository {
  Future<List<WordUnit>> findInlanguage(
    String search,
    String language,
    String translation,
  );
}
