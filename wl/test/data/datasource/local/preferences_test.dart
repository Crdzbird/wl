import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/local/preferences.datasource.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late PreferencesDataSourceContract mockPreferences;
  late MockSharedPreferences mockSharedPreferences;

  setUpAll(() async {
    mockSharedPreferences = MockSharedPreferences();
    mockPreferences =
        PreferencesDataSource(sharedPreferences: mockSharedPreferences);
  });

  group('Preferences', () {
    test('get should return correct value', () {
      when(mockPreferences.read<String>(key: 'demo')).thenReturn('demo');
      expect(mockPreferences.read<String>(key: 'demo'), 'demo');
    });

    test('set should return correct value', () {
      when(mockPreferences.write<String>(key: 'demo', value: 'demo'))
          .thenAnswer((_) async => true);
      expect(
        mockPreferences.write<String>(key: 'demo', value: 'demo'),
        completion(true),
      );
    });

    test('get should return [double] value', () {
      when(mockPreferences.read<double>(key: 'demo')).thenReturn(1);
      expect(mockPreferences.read<double>(key: 'demo'), 1.0);
    });

    test('set should return [double] value', () {
      when(mockPreferences.write<double>(key: 'demo', value: 1))
          .thenAnswer((_) async => true);
      expect(
        mockPreferences.write<double>(key: 'demo', value: 1),
        completion(true),
      );
    });

    test('get should return [int] value', () {
      when(mockPreferences.read<int>(key: 'demo')).thenReturn(1);
      expect(mockPreferences.read<int>(key: 'demo'), 1);
    });

    test('set should return [int] value', () {
      when(mockPreferences.write<int>(key: 'demo', value: 1))
          .thenAnswer((_) async => true);
      expect(
        mockPreferences.write<int>(key: 'demo', value: 1),
        completion(true),
      );
    });

    test('Read unsupported type should throw ArgumentError', () {
      try {
        mockPreferences.read<DateTime>(key: 'unsupported');
      } catch (error) {
        expect(error, isArgumentError);
        return;
      }
      fail('Expected ArgumentError was not thrown');
    });

    test('Write unsupported type should throw ArgumentError', () async {
      try {
        await mockPreferences.write(key: 'unsupported', value: DateTime.now());
      } catch (error) {
        expect(error, isArgumentError);
        return;
      }
      fail('Expected ArgumentError was not thrown');
    });

    test('clear should return correct value', () {
      when(mockPreferences.clear(key: 'demo')).thenAnswer((_) async => true);
      expect(mockPreferences.clear(key: 'demo'), completion(true));
    });

    test('clearAll should return correct value', () {
      when(mockPreferences.clearAll()).thenAnswer((_) async => true);
      expect(mockPreferences.clearAll(), completion(true));
    });

    test('writeList should return correct value', () {
      when(mockPreferences.write<List<String>>(key: 'demo', value: ['demo']))
          .thenAnswer((_) async => true);
      final result =
          mockPreferences.write<List<String>>(key: 'demo', value: ['demo']);
      expect(result, completion(true));
    });

    test('readList should return correct value', () {
      when(mockPreferences.read<List<String>>(key: 'demo'))
          .thenReturn(['demo']);
      expect(mockPreferences.read<List<String>>(key: 'demo'), ['demo']);
    });
  });
}
