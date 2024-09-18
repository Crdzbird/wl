/// Class to define the environment variables.
class DartDefine {
  /// Private constructor for the [DartDefine] class.
  factory DartDefine() => _self;

  /// Private constructor for the [DartDefine] class.
  DartDefine._internal();

  /// Singleton instance of the [DartDefine] class.
  static final DartDefine _self = DartDefine._internal();

  /// Returns the baseUrl.
  String get baseUrl => const String.fromEnvironment(
        'baseUrl',
        defaultValue: 'https://raw.githubusercontent.com',
      );
}
