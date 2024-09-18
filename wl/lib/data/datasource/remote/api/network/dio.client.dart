import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wl/core/args/dart_define.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/remote/api/dio_contract.dart';
import 'package:wl/data/extensions/dio.extension.dart';

/// The use case class for making network requests using Dio.
class DioClient extends DioContract {
  DioClient({required PreferencesDataSourceContract preferences})
      : _preferences = preferences;

  /// The singleton instance of the Dio client.
  static late final Dio _dio;

  /// The preferences instance used for making requests.
  final PreferencesDataSourceContract _preferences;

  /// Returns the Dio client instance.
  @visibleForTesting
  Dio get dio => _dio;

  /// Sets up the Dio client instance.
  @override
  void setup() {
    _dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: DartDefine().baseUrl,
      ),
    )
      ..addLoggerInterceptor()
      ..addInterceptor(_preferences);
  }

  /// Sends a DELETE request to the specified [path].
  @override
  Future<Response<Object>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.delete(
        path,
        queryParameters: queryParameters,
      );

  /// Sends a GET request to the specified [path].
  @override
  Future<Response<Object>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.get<Object>(
        path,
        queryParameters: queryParameters,
      );

  /// Sends a PATCH request to the specified [path].
  @override
  Future<Response<Object>> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) =>
      _dio.patch(
        path,
        queryParameters: queryParameters,
        data: data,
      );

  /// Sends a POST request to the specified [path].
  @override
  Future<Response<Object>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) =>
      _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
      );

  /// Sends a PUT request to the specified [path].
  @override
  Future<Response<Object>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) =>
      _dio.put(
        path,
        queryParameters: queryParameters,
        data: data,
      );
}
