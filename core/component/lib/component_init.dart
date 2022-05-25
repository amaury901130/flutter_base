import 'package:component/globals/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:domain/domain_init.dart';

class Component {
  static Future<void> initialize() async {
    globalPreferences = await SharedPreferences.getInstance();
    await Domain.initialize();
  }
}
