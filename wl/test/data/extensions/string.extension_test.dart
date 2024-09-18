import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/extensions/string.extension.dart';

void main() {
  group('StringExtension', () {
    test('replaceParams replaces parameters with provided values', () {
      const template = 'Hello, :name! Welcome to :place.';
      final result = template.replaceParams(['Alice', 'Wonderland']);
      expect(result, 'Hello, Alice! Welcome to Wonderland.');
    });

    test('replaceParams uses empty string if not enough values are provided',
        () {
      const template = 'Hello, :name! Welcome to :place.';
      final result = template.replaceParams(['Alice']);
      expect(result, 'Hello, Alice! Welcome to :place.');
    });

    test(
        'replaceParams leaves template unchanged if no parameters are provided',
        () {
      const template = 'Hello, :name! Welcome to :place.';
      final result = template.replaceParams([]);
      expect(result, 'Hello, :name! Welcome to :place.');
    });

    test('replaceParams handles no parameters in the template', () {
      const template = 'Hello, world!';
      final result = template.replaceParams(['Alice']);
      expect(result, 'Hello, world!');
    });
  });
}
