import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/enums/endpoints.enum.dart';

void main() {
  group('EndpointsEnum', () {
    test('should have correct path for pois', () {
      expect(
        EndpointsEnum.pois.path,
        '/worldline-spain/technical_test_backend/main/pois.json',
      );
    });

    test('authorizedPaths should contain the correct paths', () {
      expect(EndpointsEnum.authorizedPaths, contains(EndpointsEnum.pois.path));
    });

    test('authorizedPaths should have exactly one path', () {
      expect(EndpointsEnum.authorizedPaths.length, 1);
    });

    test('values should return correct list', () {
      expect(EndpointsEnum.authorizedPaths, isNotEmpty);
    });

    test('Font not found should throw error', () {
      expect(() => EndpointsEnum.authorizedPaths[2], throwsRangeError);
    });
  });
}
