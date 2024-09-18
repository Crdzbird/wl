import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/enums/preferences.enum.dart';

void main() {
  group('PreferencesEnum', () {
    test('should have correct cachedName for pois', () {
      expect(PreferencesEnum.pois.cachedName, 'pois');
    });

    test('should have correct cachedName for fakeToken', () {
      expect(PreferencesEnum.fakeToken.cachedName, 'fakeToken');
    });

    test('should have correct number of enum values', () {
      expect(PreferencesEnum.values.length, 2);
    });

    test('not found should throw error', () {
      expect(() => PreferencesEnum.values[3], throwsRangeError);
    });
  });
}
