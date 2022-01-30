import 'package:flutter/cupertino.dart';

class LanguageLocalization {
  static LanguageLocalization? _instance;
  LanguageLocalization._();
  static LanguageLocalization get instance =>
      _instance ??= LanguageLocalization._();

  final enLocale = const Locale("en", "US");
  final trLocale = const Locale("tr", "TR");

  List<Locale> get supportedLocales => [enLocale, trLocale];
}
