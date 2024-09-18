import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/remote/api/network/interceptors/dio.interceptor.dart';

extension DioInterceptors on Dio {
  void addLoggerInterceptor() {
    if (kDebugMode) {
      interceptors.add(
        LogInterceptor(
          logPrint: (o) => log(o.toString()),
          requestBody: true,
          responseBody: true,
        ),
      );
    }
  }

  void addInterceptor(PreferencesDataSourceContract preferences) =>
      interceptors.add(DioInterceptor(preferences));
}
