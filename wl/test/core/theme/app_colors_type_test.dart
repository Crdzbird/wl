import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wl/core/theme/app_colors_type.dart';

void main() {
  group('AppColorsType', () {
    test('Night Mode Colors', () {
      expect(AppColorsType.deepPurple.color, const Color(0xFF6A1B9A));
      expect(
        AppColorsType.transparentPurpleA200.color,
        const Color(0x33AB47BC),
      );
      expect(AppColorsType.purpleA200.color, const Color(0xFFAB47BC));
      expect(AppColorsType.purpleA400.color, const Color(0xFF8E24AA));
      expect(AppColorsType.darkGrey.color, const Color(0xFF121212));
      expect(AppColorsType.darkerGrey.color, const Color(0xFF1E1E1E));
      expect(AppColorsType.shadedGrey.color, const Color(0xFFBDBDBD));
      expect(AppColorsType.greyA700.color, const Color(0xFFB0BEC5));
      expect(AppColorsType.greyA400.color, const Color(0xFF90A4AE));
      expect(AppColorsType.greyShade800.color, const Color(0xFF424242));
      expect(AppColorsType.slateGray.color, const Color(0xFF708090));
      expect(AppColorsType.white.color, const Color(0xFFFFFFFF));
      expect(AppColorsType.redAccent.color, const Color(0xFFFF5722));
    });

    test('Day Mode Colors', () {
      expect(AppColorsType.mutedPurple.color, const Color(0xFF9370DB));
      expect(
        AppColorsType.transparentMediumPurple.color,
        const Color(0x339370DB),
      );
      expect(AppColorsType.orchid.color, const Color(0xFFBA55D3));
      expect(AppColorsType.whiteSmoke.color, const Color(0xFFF5F5F5));
      expect(AppColorsType.lavender.color, const Color(0xFFE6E6FA));
      expect(AppColorsType.indigo.color, const Color(0xFF4B0082));
    });

    test('Common Colors', () {
      expect(AppColorsType.grey.color, const Color(0xFF9E9E9E));
    });
  });
}
