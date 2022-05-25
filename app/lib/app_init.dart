import 'package:component/globals/globals.dart';
import 'package:component/globals/preferences.dart';
import 'package:component/resources/locale/localize.dart';
import 'package:component/component_init.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInit {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    Preferences.register();
    Localization.register();
    await Component.initialize();
  }
}
