/// The contract for the shared preferences data source.
abstract class PreferencesDataSourceContract {
  /// Writes the value to the shared preferences.
  ///
  /// Returns `true` if the value was successfully written, `false` otherwise.
  Future<bool> write<T>({required String key, required T value});

  /// Reads the value from the shared preferences.
  ///
  /// Returns the value of type `T` if it exists, `null` otherwise.
  T? read<T>({required String key});

  /// Clears all the shared preferences.
  Future<bool> clearAll();

  /// Clears the shared preferences for the given [key].
  Future<bool> clear({required String key});
}
