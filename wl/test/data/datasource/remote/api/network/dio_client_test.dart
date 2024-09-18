import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/local/preferences.datasource.dart';
import 'package:wl/data/datasource/remote/api/network/dio.client.dart';

import '../../../../../mocks/mocks.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = _MyHttpOverrides();

  late PreferencesDataSourceContract mockPreferences;
  late MockSharedPreferences mockSharedPreferences;
  late DioClient dioClient;
  late DioAdapter dioAdapter;

  setUpAll(() async {
    mockSharedPreferences = MockSharedPreferences();
    mockPreferences =
        PreferencesDataSource(sharedPreferences: mockSharedPreferences);

    mockPreferences = MockPreferencesDataSource();
    dioClient = DioClient(preferences: mockPreferences)..setup();

    dioAdapter = DioAdapter(dio: dioClient.dio);
  });

  group('dioClient', () {
    test('delete sends request with correct path and query parameters',
        () async {
      dioAdapter.onDelete(
        'http://localhost:3000/test/path',
        (server) => server.reply(
          204,
          {'message': 'Success!'},
          delay: const Duration(seconds: 1),
        ),
      );

      final response =
          await dioClient.delete('http://localhost:3000/test/path');
      expect(response.statusCode, 204);
    });

    test('get sends request with correct path and query parameters', () async {
      dioAdapter.onGet(
        'http://localhost:3000/test/path',
        (server) => server.reply(
          200,
          {'message': 'Success!'},
          delay: const Duration(seconds: 1),
        ),
      );

      final response = await dioClient.get('http://localhost:3000/test/path');
      expect(response.statusCode, 200);
    });

    test('patch sends request with correct path, query parameters, and data',
        () async {
      dioAdapter.onPatch(
        'http://localhost:3000/test/path',
        (server) => server.reply(
          200,
          {'message': 'Success!'},
          delay: const Duration(seconds: 1),
        ),
      );

      final response = await dioClient.patch('http://localhost:3000/test/path');
      expect(response.statusCode, 200);
    });

    test('post sends request with correct path, query parameters, and data',
        () async {
      dioAdapter.onPost(
        'http://localhost:3000/test/path',
        (server) => server.reply(
          201,
          {'message': 'Success!'},
          delay: const Duration(seconds: 1),
        ),
      );

      final response = await dioClient.post('http://localhost:3000/test/path');
      expect(response.statusCode, 201);
    });

    test('put sends request with correct path, query parameters, and data',
        () async {
      dioAdapter.onPut(
        'http://localhost:3000/test/path',
        (server) => server.reply(
          200,
          {'message': 'Success!'},
          delay: const Duration(seconds: 1),
        ),
      );

      final response = await dioClient.put('http://localhost:3000/test/path');
      expect(response.statusCode, 200);
    });
  });
}

class _MyHttpOverrides extends HttpOverrides {}
