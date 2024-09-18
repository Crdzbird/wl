import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/local/preferences.datasource.dart';
import 'package:wl/data/datasource/remote/api/network/interceptors/dio.interceptor.dart';

import '../../../../../../mocks/mocks.mocks.dart';

void main() {
  late MockErrorInterceptorHandler mockHandler;
  late DioInterceptor interceptor;

  late PreferencesDataSourceContract mockPreferences;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mockPreferences =
        PreferencesDataSource(sharedPreferences: mockSharedPreferences);
    mockHandler = MockErrorInterceptorHandler();
    interceptor = DioInterceptor(mockPreferences);
  });

  test('onError throws DioException with same data', () async {
    DioException(
      requestOptions: RequestOptions(path: '/api/data'),
      response: Response(
        statusCode: 400,
        data: {'Something went wrong'},
        requestOptions: RequestOptions(path: '/api/data'),
      ),
    );
    when(mockHandler.next(any)).thenThrow(Exception('Should not be called'));
  });
}
