import 'package:finn/features/dictionary/domain/word_unit.dart';

abstract class IWordRepository {
  Future<List<WordUnit>> find({
    required String search,
    required String language,
    required String translation,
  });
}
