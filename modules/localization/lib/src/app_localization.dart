import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../generated/l10n.dart';

class AppLocalization {
  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates =
      const [
    S.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static List<Locale> get supportedLocales => S.delegate.supportedLocales;
}
