import 'package:finn/features/dictionary/domain/i_word_repository.dart';
import 'package:finn/features/dictionary/domain/word_unit.dart';
import 'package:finn/features/dictionary/infrastructure/words_local_source.dart';

class WordRepository implements IWordRepository {
  final WordsLocalSource _localSource;

  WordRepository(this._localSource);

  Future<List<WordUnit>> find(
      {required String search,
      required String language,
      required String translation}) async {
    final wordsDtos = await _localSource.query(search, language, translation);
    final words = wordsDtos.map((word) => word.toDomain()).toList();
    return words;
  }
}
