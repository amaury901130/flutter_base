import 'package:app/globals/globals.dart';
import 'package:app/resources/locale/localize.dart';

const PREF_LANG = 'app_lang';

class Preferences {
  static Preferences get instance => getIt<Preferences>();

  static void register() => getIt.registerSingleton<Preferences>(
        Preferences._(),
      );

  Preferences._();

  Lang get appLang => LangExtensions.fromValue(
        globalPreferences.getString(PREF_LANG),
      );

  set appLang(Lang appLang) {
    globalPreferences.setString(PREF_LANG, appLang.value);
  }
}
