import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/enums/svg.enum.dart';

void main() {
  group('SvgEnum', () {
    test('SvgEnum.devotion should have correct path', () {
      expect(SvgEnum.devotion.path, 'assets/svg/devotion.svg');
    });
  });
}
