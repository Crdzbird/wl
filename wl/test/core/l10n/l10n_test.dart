import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/locale_helper.dart';
import '../../helpers/pump_app.dart';

void main() {
  group('l10n extension test', () {
    testWidgets('Localization', (widgetTester) async {
      loadLocale();
      await widgetTester.pumpAppScaffold(
        const Text('Hello World'),
      );
      final (localization, _) =
          await widgetTester.getLocalizationsWithWidgetTesterUnderTests();
      expect(localization, isNotNull);
    });
  });
}
