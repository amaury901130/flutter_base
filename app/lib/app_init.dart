import 'package:app/globals/globals.dart';
import 'package:app/globals/preferences.dart';
import 'package:app/locale/localize.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:repository/repo_init.dart';

class AppInit {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    Preferences.register();
    Localization.register(Preferences.instance);
    await Repo.initialize();
  }
}
