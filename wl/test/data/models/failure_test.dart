import 'package:flutter_test/flutter_test.dart';
import 'package:wl/data/models/failure.dart';

void main() {
  group('Failure', () {
    test('ServerFailure should be a subclass of Failure', () {
      final failure = ServerFailure(errorMessage: 'Server error');
      expect(failure, isA<Failure>());
    });

    test('CacheFailure should be a subclass of Failure', () {
      final failure = CacheFailure(errorMessage: 'Cache error');
      expect(failure, isA<Failure>());
    });

    test('ServerFailure props should contain errorMessage', () {
      const errorMessage = 'Server error';
      final failure = ServerFailure(errorMessage: errorMessage);
      expect(failure.props, [errorMessage]);
    });

    test('CacheFailure props should contain errorMessage', () {
      const errorMessage = 'Cache error';
      final failure = CacheFailure(errorMessage: errorMessage);
      expect(failure.props, [errorMessage]);
    });

    test('ServerFailure should support value equality', () {
      final failure1 = ServerFailure(errorMessage: 'Server error');
      final failure2 = ServerFailure(errorMessage: 'Server error');
      expect(failure1, equals(failure2));
    });

    test('CacheFailure should support value equality', () {
      final failure1 = CacheFailure(errorMessage: 'Cache error');
      final failure2 = CacheFailure(errorMessage: 'Cache error');
      expect(failure1, equals(failure2));
    });
  });
}
