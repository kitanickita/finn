abstract class AbstractTargetLanguageStorage {
  /// reads current target language of the app.
  String read();

  /// Saves target language of the app.
  Future<void> save(String language);
}
