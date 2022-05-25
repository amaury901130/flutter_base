import 'package:component/globals/globals.dart';
import 'package:component/providers/theme_provider.dart';
import 'package:component/resources/locale/localize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const PREF_LANG = 'app_lang';
const PREF_THEME = 'app_theme';

final currentThemeMode =
    StateProvider<ThemeMode>((_) => Preferences.instance.themeMode);

class Preferences {
  static Preferences get instance => getIt<Preferences>();

  static void register() =>
      getIt.registerSingleton<Preferences>(Preferences._());

  Preferences._();

  ThemeMode get themeMode => ThemeModeHelper.fromName(
      globalPreferences.getString(PREF_THEME) ?? ThemeModeHelper.lightName);

  set themeMode(ThemeMode newThemeMode) {
    globalPreferences.setString(
      PREF_THEME,
      newThemeMode.name(),
    );
  }

  Lang? get appLang =>
      LangExtensions.fromValue(globalPreferences.getString(PREF_LANG));

  void saveAppLang(WidgetRef? reader, Lang appLang) {
    globalPreferences.setString(
      PREF_LANG,
      appLang.value,
    );
    reader?.read(appLocaleProvider.notifier).state = appLang.locale;
  }
}
