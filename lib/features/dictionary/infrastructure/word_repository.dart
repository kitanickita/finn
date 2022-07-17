import 'package:finn/features/dictionary/domain/i_word_repository.dart';
import 'package:finn/features/dictionary/domain/word_unit.dart';
import 'package:finn/features/dictionary/infastructure/words_local_source.dart';

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
