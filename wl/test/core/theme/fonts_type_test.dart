import 'package:flutter_test/flutter_test.dart';
import 'package:wl/core/theme/fonts_type.dart';

void main() {
  group('FontsType', () {
    test('should have correct font values', () {
      expect(FontsType.kansas.font, 'Kansas');
      expect(FontsType.polar.font, 'Polar');
      expect(FontsType.segoeUI.font, 'SegoeUI');
    });

    test('should return a list of font names', () {
      final fonts = FontsType.fonts;
      expect(fonts, ['Kansas', 'Polar', 'SegoeUI']);
    });
  });
}
