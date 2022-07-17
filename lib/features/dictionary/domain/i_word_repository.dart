import 'package:finn/features/dictionary/domain/word_unit.dart';

abstract class IWordRepository {
  Future<List<WordUnit>> find(
      String search, String language, String translation);
}
