import 'package:dio/dio.dart';

/// A generic repository interface for making HTTP requests using Dio.
///
/// This abstract class defines methods for performing common HTTP operations
/// such as GET, POST, PUT, DELETE, and PATCH.
///
/// Implementations of this class should provide the necessary setup
/// for making HTTP requests using Dio.
abstract class DioContract {
  /// Performs the necessary setup for making HTTP requests.
  void setup();

  /// Sends a GET request to the specified [path].
  ///
  /// Optional [queryParameters] can be provided to include query parameters
  /// in the request.
  ///
  /// Returns a [Future] that completes with a [Response] object containing
  /// the response data.
  Future<Response<Object>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  /// Sends a POST request to the specified [path].
  ///
  /// Optional [queryParameters] can be provided to include query parameters
  /// in the request.
  ///
  /// The [data] parameter can be used to send additional data in the body.
  ///
  /// Returns a [Future] that completes with a [Response] object containing
  /// the response data.
  Future<Response<Object>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  /// Sends a PUT request to the specified [path].
  ///
  /// Optional [queryParameters] can be provided to include query parameters
  /// in the request.
  ///
  /// The [data] parameter can be used to send additional data in the body.
  ///
  /// Returns a [Future] that completes with a [Response] object containing
  /// the response data.
  Future<Response<Object>> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });

  /// Sends a DELETE request to the specified [path].
  ///
  /// Optional [queryParameters] can be provided to include query parameters
  /// in the request.
  ///
  /// Returns a [Future] that completes with a [Response] object containing
  /// the response data.
  Future<Response<Object>> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
  });

  /// Sends a PATCH request to the specified [path].
  ///
  /// Optional [queryParameters] can be provided to include query parameters
  /// in the request.
  ///
  /// The [data] parameter can be used to send additional data in the body.
  ///
  /// Returns a [Future] that completes with a [Response] object containing
  /// the response data.
  Future<Response<Object>> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  });
}
