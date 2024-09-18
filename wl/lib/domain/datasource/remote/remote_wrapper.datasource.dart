import 'dart:developer';

import 'package:wl/core/args/dart_define.dart';
import 'package:wl/data/datasource/remote/api/dio_contract.dart';
import 'package:wl/data/enums/endpoints.enum.dart';
import 'package:wl/data/models/failure.dart';
import 'package:wl/data/models/stadiums/wrapper.dart';
import 'package:wl/domain/datasource/remote/remote_wrapper.datasource.contract.dart';

class RemoteWrapperDataSource extends RemoteWrapperDataSourceContract {
  RemoteWrapperDataSource(DioContract dio) : _dio = dio;

  final DioContract _dio;
  @override
  Future<(Failure?, Wrapper?)> fetch() async {
    try {
      final result = await _dio.get(
        '${DartDefine().baseUrl}${EndpointsEnum.pois.path}',
      );
      return (null, Wrapper.fromJson('${result.data!}'));
    } on Exception catch (e) {
      return (
        ServerFailure(
          errorMessage: e.toString(),
        ),
        null
      );
    }
  }

  @override
  void filter() {
    log('Filter method called');
  }
}
