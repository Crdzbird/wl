import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wl/core/global/global.dart';
import 'package:wl/core/l10n/l10n.dart';
import 'package:wl/core/theme/theme_context.dart';
import 'package:wl/core/utils/locale_resolution.dart';
import 'package:wl/core/utils/platform_scroll_behavior.dart';
import 'package:wl/data/datasource/local/preferences.datasource.contract.dart';
import 'package:wl/data/datasource/local/preferences.datasource.dart';
import 'package:wl/data/datasource/remote/api/dio_contract.dart';
import 'package:wl/data/datasource/remote/api/network/dio.client.dart';
import 'package:wl/presentation/router/wl.router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<PreferencesDataSourceContract>(
          create: (_) =>
              PreferencesDataSource(sharedPreferences: Global.preferences),
        ),
        RepositoryProvider<DioContract>(
          create: (rpContext) => DioClient(
            preferences: rpContext.read<PreferencesDataSourceContract>(),
          )..setup(),
        ),
      ],
      child: MaterialApp.router(
        theme: context.dayMode,
        darkTheme: context.darkMode,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        localeListResolutionCallback: localeResolution,
        scrollBehavior: PlatformScrollBehavior(),
        routerConfig: WlRouter().config(),
      ),
    );
  }
}
