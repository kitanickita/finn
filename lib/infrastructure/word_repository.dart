import 'package:finn/domain/i_word_repository.dart';
import 'package:finn/domain/models/word_unit.dart';
import 'package:finn/infrastructure/words_local_source.dart';

class WordRepository implements IWordRepository {
  final WordsLocalSource _localSource;

  WordRepository(this._localSource);

  Future<List<WordUnit>> find(
      String search, String language, String translation) async {
    final wordsDtos = await _localSource.query(search, language, translation);
    final words = wordsDtos.map((word) => word.toDomain()).toList();
    return words;
  }
}
