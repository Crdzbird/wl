import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wl/core/args/dart_define.dart';
import 'package:wl/data/datasource/local/preferences.datasource.dart';
import 'package:wl/data/datasource/remote/api/dio_contract.dart';
import 'package:wl/data/datasource/remote/api/network/dio.client.dart';
import 'package:wl/data/datasource/remote/api/network/interceptors/dio.interceptor.dart';
import 'package:wl/domain/datasource/local/wrapper.datasource.dart';
import 'package:wl/domain/datasource/remote/remote_wrapper.datasource.dart';
import 'package:wl/domain/wrapper/wrapper.bloc.datasource.dart';
import 'package:wl/presentation/dashboard/bloc/filter/filter_cubit.dart';
import 'package:wl/presentation/dashboard/bloc/poi_bloc.dart';
import 'package:wl/presentation/detail/bloc/detail_bloc.dart';

// Custom Mocks
class MockVoidCallback extends Mock {
  void call();
}

// Generated mocks
@GenerateMocks(
  [
    PreferencesDataSource,
    WrapperDataSource,
    RemoteWrapperDataSource,
    DartDefine,
    WrapperBlocDataSource,
    DioException,
    Dio,
    DioContract,
    DioClient,
    DioInterceptor,
    ErrorInterceptorHandler,
  ],
)
class GeneratedMocks {}

@GenerateNiceMocks([
  MockSpec<BuildContext>(),
  MockSpec<PoiBloc>(),
  MockSpec<SharedPreferences>(),
  MockSpec<FilterCubit>(),
  MockSpec<DetailBloc>(),
])
class GeneratedNiceMocks {}
