import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/enums/endpoints.enum.dart';
import 'package:wl/data/enums/preferences.enum.dart';

/// Interceptor for Dio requests.
class DioInterceptor extends Interceptor {
  DioInterceptor(PreferencesDataSourceContract preferences)
      : _preferences = preferences;

  /// The preferences has a single instance where the token can be called and
  /// injected into the request.
  final PreferencesDataSourceContract _preferences;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (EndpointsEnum.authorizedPaths.contains(options.uri.path)) {
      log('We can inject token without worrying about for future requests');
      final fakeToken = _preferences.read<String>(
            key: PreferencesEnum.fakeToken.cachedName,
          ) ??
          '';
      // Set authorization header with bearer token
      options.headers[HttpHeaders.dateHeader] = 'this is a $fakeToken';
    }
    handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);
}
