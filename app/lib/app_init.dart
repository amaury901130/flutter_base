import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:repository/repo_init.dart';

final getIt = GetIt.instance;
SharedPreferences globalPreferences;

class AppInit {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    await RepoInit.initialize();
  }
}
