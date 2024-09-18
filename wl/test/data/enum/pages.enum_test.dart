import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/enums/pages.enum.dart';

void main() {
  group('PagesEnum', () {
    test('splash path should be "/"', () {
      expect(PagesEnum.splash.path, '/');
    });

    test('dashboard path should be "/dashboard"', () {
      expect(PagesEnum.dashboard.path, '/dashboard');
    });

    test('detail path should be "/detail/:id"', () {
      expect(PagesEnum.detail.path, '/detail/:id');
    });

    test('values should return correct list', () {
      expect(
        PagesEnum.values,
        [PagesEnum.splash, PagesEnum.dashboard, PagesEnum.detail],
      );
    });

    test('Font not found should throw error', () {
      expect(() => PagesEnum.values[5], throwsRangeError);
    });
  });
}
