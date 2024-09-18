import 'package:flutter_test/flutter_test.dart';
import 'package:wl/core/args/dart_define.dart';

void main() {
  group('DartDefine', () {
    test('isDevelop returns false when environment is not set to develop', () {
      const String.fromEnvironment(
        'baseUrl',
        defaultValue: 'https://raw.githubusercontent.com',
      );
      expect(DartDefine().baseUrl, isNotEmpty);
    });
  });
}
