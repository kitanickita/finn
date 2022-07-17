import 'package:finn/features/dictionary/domain/languages.dart';
import 'package:finn/features/target_language/application/target_language_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final targetLanguageStorageProvider =
    FutureProvider<SharedPreferences>((ref) async {
  final prefs = await SharedPreferences.getInstance();

  return prefs;
});

final targetLanguageRepositoryProvider = Provider(
  (ref) => ref.watch(targetLanguageStorageProvider),
);

final targetLanguageStateNotifierProvider =
    StateNotifierProvider<TargetLanguageNotifier, LanguageType>(
  (ref) => ref.watch(targetLanguageRepositoryProvider),
);
