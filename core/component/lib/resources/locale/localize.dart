import 'package:component/globals/globals.dart';
import 'package:component/globals/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'en.dart' as enLang;
import 'es.dart' as esLang;

enum Lang { es, en }

enum Localize {
  welcome_message,
  cta_toggle_message,
}

class Localization {
  Lang currentLang = LangExtensions.defaultLang;

  static Localization get instance => getIt<Localization>();

  static void register() => getIt.registerSingleton<Localization>(
        Localization._(),
      );

  Localization._();

  void saveLang(WidgetRef? reader, Lang lang) {
    this.currentLang = lang;
    Preferences.instance.saveAppLang(reader, lang);
  }
}

extension LangExtensions on Lang {
  static Map<String, Lang> langValues = {
    Lang.en.toString(): Lang.en,
    Lang.es.toString(): Lang.es
  };

  static Map<Lang, Locale> langLocale = {
    defaultLang: defaultLocaleLang,
    Lang.es: Locale('es', '')
  };

  static Lang defaultLang = Lang.en;
  static Locale defaultLocaleLang = Locale('en', '');

  static Lang? fromValue(String? fromValue) => langValues[fromValue];
  static Lang fromLocale(Locale locale) {
    var lang = defaultLang;
    langLocale.forEach((key, value) {
      //TODO: compare by country if needed
      if (value.languageCode == locale.languageCode) {
        lang = key;
      }
    });

    return lang;
  }

  Locale get locale => langLocale[this] ?? defaultLocaleLang;

  String get value => this.toString();
}

// use %ns for interpolation example: %1s, %2s
const Map<Lang, Map<Localize, String>> localize = {
  Lang.en: enLang.localization,
  Lang.es: esLang.localization,
};
