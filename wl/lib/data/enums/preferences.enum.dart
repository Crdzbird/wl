enum PreferencesEnum {
  pois('pois'),
  fakeToken('fakeToken');

  /// Constructs a [PreferencesEnum] with the given [cachedName].
  const PreferencesEnum(this.cachedName);

  /// The type of the preference.
  final String cachedName;
}
