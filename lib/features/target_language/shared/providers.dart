import 'package:finn/features/dictionary/domain/languages.dart';
import 'package:finn/features/target_language/application/target_language_notifier.dart';
import 'package:finn/features/target_language/infrastructure/abstract_target_language_storage.dart';
import 'package:finn/features/target_language/infrastructure/target_language_repository.dart';
import 'package:finn/features/target_language/infrastructure/target_language_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final targetLanguageStorageProvider =
    Provider<AbstractTargetLanguageStorage>((ref) {
  return TargetLanguageStorage(ref.watch(sharedPreferencesProvider));
});

final targetLanguageRepositoryProvider =
    Provider<TargetLanguageRepository>((ref) {
  return TargetLanguageRepository(ref.watch(targetLanguageStorageProvider));
});

final targetLanguageStateNotifierProvider =
    StateNotifierProvider<TargetLanguageNotifier, LanguageType>(
  (ref) => TargetLanguageNotifier(ref.watch(targetLanguageRepositoryProvider)),
);
