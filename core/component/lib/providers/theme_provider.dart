import 'package:component/globals/preferences.dart';
import 'package:component/resources/locale/localize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme/variants/light.dart';
import 'package:theme/variants/dark.dart';

final lightThemeProvider = StateProvider<ThemeData>((_) => LightTheme().data);
final darkThemeProvider = StateProvider<ThemeData>((_) => DarkTheme().data);

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  final themeMode = ref.watch(currentThemeMode);
  Preferences.instance.themeMode = themeMode;
  return themeMode;
});

final appLocaleProvider = StateProvider<Locale>((ref) {
  var appLang = Preferences.instance.appLang;
  return LangExtensions.langLocale[appLang] ?? LangExtensions.defaultLocaleLang;
});

extension ThemeModeHelper on ThemeMode {
  static final darkName = "dark";
  static final systemName = "system";
  static final lightName = "light";

  static final Map<String, ThemeMode> themeModeValues = {
    darkName: ThemeMode.dark,
    lightName: ThemeMode.light,
    systemName: ThemeMode.system
  };

  static ThemeMode fromName(String name) =>
      themeModeValues[name] ?? ThemeMode.system;

  String name() {
    var themeMode = systemName;
    themeModeValues.forEach((key, value) {
      if (value == this) {
        themeMode = key;
      }
    });
    return themeMode;
  }

  static void toggleTheme(WidgetRef ref) {
    final currentTheme = ref.read(currentThemeMode);
    ref.read(currentThemeMode.notifier).state = (currentTheme == ThemeMode.dark)
        ? ThemeMode.light
        : ThemeMode.dark;
  }
}
