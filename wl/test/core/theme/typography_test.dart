import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wl/core/theme/app_colors_type.dart';
import 'package:wl/core/theme/typography.dart';

void main() {
  group('Typography Light Theme', () {
    test('displayLarge has correct properties', () {
      final textStyle = typographyLightTheme.displayLarge!;
      expect(textStyle.color, AppColorsType.indigo.color);
      expect(textStyle.fontSize, 50);
      expect(textStyle.fontWeight, FontWeight.bold);
    });

    test('displayMedium has correct properties', () {
      final textStyle = typographyLightTheme.displayMedium!;
      expect(textStyle.color, AppColorsType.indigo.color);
      expect(textStyle.fontSize, 40);
      expect(textStyle.fontWeight, FontWeight.bold);
    });

    // Add more tests for other text styles in typographyLightTheme
  });

  group('Typography Dark Theme', () {
    test('displayLarge has correct properties', () {
      final textStyle = typographyDarkTheme.displayLarge!;
      expect(textStyle.color, AppColorsType.white.color);
      expect(textStyle.fontSize, 50);
      expect(textStyle.fontWeight, FontWeight.bold);
    });

    test('displayMedium has correct properties', () {
      final textStyle = typographyDarkTheme.displayMedium!;
      expect(textStyle.color, AppColorsType.white.color);
      expect(textStyle.fontSize, 40);
      expect(textStyle.fontWeight, FontWeight.bold);
    });

    // Add more tests for other text styles in typographyDarkTheme
  });
}
