//  Create repository provider
import 'package:finn/application/dict_provider.dart';
import 'package:finn/application/dict_state.dart';
import 'package:finn/domain/i_word_repository.dart';
import 'package:finn/infrastructure/word_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dictRepository = Provider<IWordRepository>((ref) => WordRepository());
// Dictionary provider
final dictProvider = StateNotifierProvider.autoDispose<DictNotifier, DictState>(
  (ref) => DictNotifier(ref.watch(dictRepository)),
);
