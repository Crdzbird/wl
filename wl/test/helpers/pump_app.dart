import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wl/core/l10n/l10n.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpAppScaffold(Widget widget) {
    return pumpWidget(_app(Scaffold(body: widget)));
  }

  Widget _app(Widget widget) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: widget,
    );
  }

  Future<(AppLocalizations, WidgetTester)>
      getLocalizationsWithWidgetTesterUnderTests() async {
    late AppLocalizations result;
    await pumpWidget(
      MaterialApp(
        localizationsDelegates: const <LocalizationsDelegate<Object>>[
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
        home: Material(
          child: Builder(
            builder: (BuildContext context) {
              result = AppLocalizations.of(context);
              debugPrint('[DEBUG]: locale: $result');

              // The builder function must return a widget.
              return const Placeholder();
            },
          ),
        ),
      ),
    );
    await pumpAndSettle();
    return (result, this);
  }

  Future<AppLocalizations> getLocalizations() async {
    final (l10n, _) = await getLocalizationsWithWidgetTesterUnderTests();
    return l10n;
  }
}
