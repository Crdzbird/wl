import 'package:flutter_test/flutter_test.dart';
import 'package:wl/core/global/global.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;

  setUpAll(() async {
    mockSharedPreferences = MockSharedPreferences();
    Global.preferences = mockSharedPreferences;
  });

  group('Globals', () {
    test('sharedPreferences should be initialized', () {
      expect(Global.preferences, isNotNull);
    });
  });
}
