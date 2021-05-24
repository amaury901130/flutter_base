import 'package:app/globals/globals.dart';
import 'package:app/globals/preferences.dart';

import 'en.dart' as enLang;
import 'es.dart' as esLang;

enum Lang { es, en }

class Localization {
  final Lang currentLang;

  static Localization get instance => getIt<Localization>();

  static void register(Preferences prefs) =>
      getIt.registerSingleton<Localization>(
        Localization._(prefs.appLang),
      );

  Localization._(this.currentLang);

  void saveLang(Lang lang) {
    Preferences.instance.appLang = lang;
  }
}

extension LangExtensions on Lang {
  static Map<Lang, String> langValues = {
    Lang.en: 'en',
    Lang.es: 'es',
  };

  static Lang defaultLang = Lang.en;

  static Lang fromValue(String? fromValue) {
    var langValue = defaultLang;

    if (fromValue == null) {
      return langValue;
    }

    langValues.forEach((key, value) {
      if (value == fromValue) {
        langValue = key;
      }
    });

    return langValue;
  }

  String get value => langValues[this]!;
}

enum Localize {
  welcome_message,
}

// use %ns for interpolation example: %1s, %2s
const Map<Lang, Map<Localize, String>> localize = {
  Lang.en: enLang.localization,
  Lang.es: esLang.localization,
};
