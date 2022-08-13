//  Create repository provider
import 'package:finn/features/dictionary/application/dict_provider.dart';
import 'package:finn/features/dictionary/application/dict_state.dart';
import 'package:finn/features/dictionary/domain/i_word_repository.dart';
import 'package:finn/features/dictionary/infrastructure/word_repository.dart';
import 'package:finn/features/dictionary/infrastructure/words_local_source.dart';
import 'package:finn/features/target_language/shared/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dictRepository = Provider<IWordRepository>(
    (ref) => WordRepository(ref.read(wordsLocalSourceProvider)));

final wordsLocalSourceProvider = Provider(
  (ref) => WordsLocalSource(),
);
// Dictionary provider
final dictProvider = StateNotifierProvider.autoDispose<DictNotifier, DictState>(
  (ref) => DictNotifier(
    ref.watch(dictRepository),
    ref.watch(targetLanguageRepositoryProvider),
  ),
);
