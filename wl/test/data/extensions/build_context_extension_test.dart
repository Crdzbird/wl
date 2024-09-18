import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wl/core/theme/app_colors_type.dart';
import 'package:wl/core/theme/theme_context.dart';
import 'package:wl/core/theme/typography.dart';
import 'package:wl/data/extensions/build_context.extension.dart';

import '../../mocks/mocks.mocks.dart';

void main() {
  late MockBuildContext context0;

  setUp(() => context0 = MockBuildContext());
  group('BuildContextExtension', () {
    test('light theme has correct primary color', () {
      expect(context0.dayMode.primaryColor, AppColorsType.mutedPurple.color);
    });

    test('light theme has correct scaffold background color', () {
      expect(
        context0.dayMode.scaffoldBackgroundColor,
        AppColorsType.whiteSmoke.color,
      );
    });

    test('light theme has correct text theme', () {
      final actualTheme = context0.dayMode.textTheme.displayLarge;
      final expectedTheme = typographyLightTheme.displayLarge;

      expect(actualTheme?.color, expectedTheme?.color);
      expect(actualTheme?.fontSize, expectedTheme?.fontSize);
      expect(actualTheme?.fontWeight, expectedTheme?.fontWeight);
      expect(actualTheme?.height, expectedTheme?.height);
      expect(actualTheme?.letterSpacing, expectedTheme?.letterSpacing);
      expect(actualTheme?.wordSpacing, expectedTheme?.wordSpacing);
    });

    test('light theme has correct card theme color', () {
      expect(context0.dayMode.cardTheme.color, AppColorsType.lavender.color);
    });

    test('light theme has correct app bar theme color', () {
      expect(
        context0.dayMode.appBarTheme.backgroundColor,
        AppColorsType.mutedPurple.color,
      );
    });

    test('light theme has correct dialog background color', () {
      expect(
        context0.dayMode.dialogBackgroundColor,
        AppColorsType.lavender.color,
      );
    });

    testWidgets('height returns correct value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(size: Size(600, 600)), // Specify a size
            child: Scaffold(),
          ),
        ),
      );
      await tester.pump();
      final context = tester.element(find.byType(Scaffold));
      expect(context.height, MediaQuery.of(context).size.height);
    });

    testWidgets('width returns correct value', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MediaQuery(
            data: MediaQueryData(size: Size(600, 600)), // Specify a size
            child: Scaffold(),
          ),
        ),
      );
      await tester.pump();
      final context = tester.element(find.byType(Scaffold));
      expect(context.width, MediaQuery.of(context).size.width);
    });
  });
}
