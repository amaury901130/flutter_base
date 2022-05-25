import 'package:component/providers/theme_provider.dart';
import 'package:component/resources/app_localization.dart';
import 'package:app/ui/screens/main_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class App extends ConsumerWidget {
  @override
  Widget build(_, WidgetRef ref) {
    final mode = ref.watch(themeModeProvider);
    final appLocale = ref.watch(appLocaleProvider);
    return MaterialApp(
      theme: ref.read(lightThemeProvider.notifier).state,
      darkTheme: ref.read(darkThemeProvider.notifier).state,
      themeMode: mode,
      initialRoute: MainScreen.route,
      locale: appLocale,
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('es', ''), // Spanish, no country code
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        MainScreen.route: (context) => MainScreen(),
      },
    );
  }
}
