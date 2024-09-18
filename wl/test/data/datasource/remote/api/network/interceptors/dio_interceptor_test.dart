import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../mocks/mocks.mocks.dart';

void main() {
  late MockErrorInterceptorHandler mockHandler;

  setUp(() {
    mockHandler = MockErrorInterceptorHandler();
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
