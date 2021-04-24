import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;
SharedPreferences globalPreferences;

class AppInit {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    //initialize resources
  }
}
