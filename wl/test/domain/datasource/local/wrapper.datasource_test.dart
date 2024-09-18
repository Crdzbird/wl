import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/local/preferences.datasource.dart';
import 'package:wl/data/enums/preferences.enum.dart';
import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/stadium.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/domain/datasource/local/wrapper.datasource.dart';

import '../../../mocks/mocks.mocks.dart';

void main() {
  late WrapperDataSource wrapperDataSource;
  late PreferencesDataSourceContract mockPreferences;
  late MockSharedPreferences mockSharedPreferences;

  setUpAll(() async {
    mockSharedPreferences = MockSharedPreferences();

    SharedPreferences.setMockInitialValues({
      PreferencesEnum.pois.cachedName:
          "{'stadiums': [{'id': '1', 'title': 'Stadium 1'}]}",
    });
    mockPreferences =
        PreferencesDataSource(sharedPreferences: mockSharedPreferences);
    wrapperDataSource = WrapperDataSource(mockPreferences);
  });

  group('WrapperDataSource', () {
    group('get', () {
      test('should return Wrapper when there is cached data', () {
        const wrapperJson = '{"stadiums": []}';
        when(mockPreferences.read<String>(key: PreferencesEnum.pois.cachedName))
            .thenReturn(wrapperJson);

        final result = wrapperDataSource.get();

        expect(result, (null, Wrapper.fromJson(wrapperJson)));
      });

      test('should return empty Wrapper when there is no cached data', () {
        when(mockPreferences.read<String>(key: PreferencesEnum.pois.cachedName))
            .thenReturn('');

        final result = wrapperDataSource.get();

        expect(result, (null, const Wrapper()));
      });

      test('should return CacheFailure when an exception occurs', () {
        when(mockPreferences.read<String>(key: PreferencesEnum.pois.cachedName))
            .thenThrow(Exception('Cache error'));

        final result = wrapperDataSource.get();

        expect(result.$1, isA<CacheFailure>());
      });
    });

    group('store', () {
      test('should store Wrapper successfully', () async {
        const wrapper = Wrapper();
        when(
          mockPreferences.write<String>(
            key: PreferencesEnum.pois.cachedName,
            value: wrapper.toJson,
          ),
        ).thenAnswer((_) async => true);

        final result = await wrapperDataSource.store(wrapper: wrapper);

        expect(result, true);
      });
    });

    test('should return empty Stadium when there is no cached data', () {
      when(mockPreferences.read<String>(key: PreferencesEnum.pois.cachedName))
          .thenReturn('');

      final result = wrapperDataSource.getStadium('1');

      expect(result, const Stadium());
    });
  });
}
