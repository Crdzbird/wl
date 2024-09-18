import 'package:intl/date_symbol_data_custom.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/date_symbols.dart';
import 'package:intl/date_time_patterns.dart';

void loadLocale() {
  final symbols = dateTimeSymbolMap();
  final patterns = dateTimePatternMap();
  final locales = <dynamic>[];
  symbols.keys.take(10).forEach(locales.add);
  // Force inclusion of locales that are hard-coded in tests.
  final requiredLocales = ['en', 'es'];
  locales.addAll(requiredLocales);
  for (final locale in locales) {
    initializeDateFormattingCustom(
      locale: locale as String,
      symbols: symbols[locale] as DateSymbols,
      patterns: patterns[locale],
    );
  }
}
